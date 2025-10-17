# Alt Text to Caption Migration
#
# This rake task migrates alt text content to caption fields for images in Whitehall.
# It applies conditional logic to determine the best caption based on existing alt text
# and caption content, handling credit terms, duplicates, and length preferences.
#
# The migration is idempotent - it can be safely re-run multiple times. Images are
# processed in batches and alt text is cleared after processing to mark completion.
# Documents with updated images are automatically enqueued for republishing to make
# changes visible to users.
#
# Usage with GOV.UK Docker:
#   govuk-docker-run bundle exec rake data_migration:alt_text_to_caption
#   govuk-docker-run bundle exec rake data_migration:preview_alt_text_to_caption
#
# Business Logic:
# 1. Empty alt text → keep existing caption
# 2. Identical content → avoid duplication
# 3. Credit terms + descriptive alt text (>10 chars) → combine: "alt text [caption]"
# 4. Default → use longer text (or alt text if caption empty)
# 5. Changed images → enqueue document for republishing
#

# Constants for the migration
ALT_TEXT_MIGRATION_BATCH_SIZE = 1000
ALT_TEXT_MIGRATION_DESCRIPTIVE_MIN_LENGTH = 10
ALT_TEXT_MIGRATION_CREDIT_TERMS = ["credit", "copyright", "source", "©", "crown copyright"].freeze

namespace :data_migration do
  desc "Migrate alt text to caption fields"
  task alt_text_to_caption: :environment do
    images_scope = Image.where.not(alt_text: [nil, ""])
    total_images = images_scope.count

    puts "Processing #{total_images} images with alt text..."

    if total_images.zero?
      puts "No images with alt text found."
      next
    end

    updated_count = 0
    republish_count = 0
    images_scope.find_in_batches(batch_size: ALT_TEXT_MIGRATION_BATCH_SIZE) do |batch|
      batch.each do |image|
        new_caption = determine_new_caption(image.alt_text, image.caption)
        current_caption = image.caption.to_s.strip

        if new_caption != current_caption
          image.update_columns(caption: new_caption, alt_text: nil)
          updated_count += 1
          enqueue_republishing(image)
          republish_count += 1
        else
          image.update_column(:alt_text, nil)
        end
      end
    end

    puts "Migration complete! Updated #{updated_count}/#{total_images} captions."
    puts "Enqueued #{republish_count} documents for republishing."
  end

  desc "Preview alt text to caption migration changes (first 10 examples)"
  task preview_alt_text_to_caption: :environment do
    images_scope = Image.where.not(alt_text: [nil, ""]).limit(10)

    puts "Previewing migration changes for first 10 images with alt text:"
    puts

    if images_scope.empty?
      puts "No images with alt text found."
      next
    end

    changes_count = 0
    images_scope.each_with_index do |image, index|
      new_caption = determine_new_caption(image.alt_text, image.caption)
      current_caption = image.caption.to_s.strip

      if new_caption != current_caption
        changes_count += 1
        puts "#{index + 1}. Image ##{image.id} - WOULD CHANGE:"
        puts "   Alt text: \"#{image.alt_text}\""
        puts "   Current caption: \"#{current_caption.presence || '(empty)'}\""
        puts "   New caption: \"#{new_caption}\""
        puts "   Document: #{image.edition&.document_id ? "#{image.edition.title} (ID: #{image.edition.document_id})" : 'No document'}"
        puts "   → Would enqueue for republishing"
      else
        puts "#{index + 1}. Image ##{image.id} - no change (alt text cleared only)"
      end
      puts
    end

    puts "Preview complete: #{changes_count}/#{images_scope.count} images would have caption changes."
  end
end

def determine_new_caption(alt_text, caption)
  alt_text = alt_text.to_s.strip
  caption = caption.to_s.strip

  return caption if alt_text.blank?
  return caption if alt_text == caption

  if caption_starts_with_credit_terms?(caption) && alt_text.length > ALT_TEXT_MIGRATION_DESCRIPTIVE_MIN_LENGTH
    return "#{alt_text} [#{caption}]"
  end

  if caption.blank? || alt_text.length > caption.length
    alt_text
  else
    caption
  end
end

def caption_starts_with_credit_terms?(caption)
  return false if caption.blank?

  ALT_TEXT_MIGRATION_CREDIT_TERMS.any? { |term| caption.downcase.start_with?(term) }
end

def enqueue_republishing(image)
  return unless image.edition&.document_id

  PublishingApiDocumentRepublishingWorker.perform_async(image.edition.document_id)
rescue StandardError => e
  puts "Warning: Failed to enqueue republishing for image #{image.id}, edition #{image.edition&.id}: #{e.message}"
end
