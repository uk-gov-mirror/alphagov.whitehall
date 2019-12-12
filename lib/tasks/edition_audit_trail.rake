def audit_trail_entry(entry)
  output = "\n"

  output << '{GRAVATAR} '

  if entry.is_a?(Edition::AuditTrail::VersionAuditEntry) && entry.action == "published"
    output << "[Compare with previous version] "
  end

  output << describe_audit_trail_entry(entry)
end

def describe_audit_trail_entry(entry)
  output = ""

  if entry.respond_to?(:message)
    output << entry.message
  else
    output << entry.action.capitalize + " by"
  end

  output << " "

  if entry.actor
    output << entry.actor.name
  else
    output << "User (removed)"
  end

  output << "\n"
  output << entry.created_at.strftime('%d %B %Y %l:%M%P')
end

def render_editorial_remarks(remarks, edition)
  this_edition_remarks, other_edition_remarks = remarks.partition { |r| r.edition == edition }
  output = "\n"

  if this_edition_remarks.any?
    output << "On this edition"
    this_edition_remarks.each do |entry|
      output << audit_trail_entry(entry)
    end
  end

  if other_edition_remarks.any?
    output << "On previous editions"
    other_edition_remarks.each do |entry|
      output << audit_trail_entry(entry)
    end
  end

  output
end

def format_in_paragraphs(string)
  safe_join(
    String(string)
      .split(/(?:\r?\n){2}/)
      .map { |paragraph| content_tag(:p, paragraph) },
  )
end

def distance(datetime)
  # I18n.l distance_of_time_in_words_to_now(datetime)
  distance_of_time_in_words_to_now(datetime)
end

def fact_check_responses(edition)
  output = "\n"

  if edition.all_completed_fact_check_requests.any?
    output << "Responses"
    edition.all_completed_fact_check_requests.includes(:edition).each do |fact_check_request|
      output << fact_check_request.email_address
      output << " #{distance(fact_check_request.updated_at)} ago"
      output << format_in_paragraphs(fact_check_request.comments)
      output << " (This refers to an older edition.)" unless fact_check_request.edition == edition
    end
  else
    output << "Document doesn't have any fact checking responses yet."
  end

  if edition.fact_check_requests.pending.any?
    output << "Pending requests"
    edition.fact_check_requests.pending.each do |fact_check_request|
      output << fact_check_request.email_address
      output << " (#{distance(fact_check_request.updated_at)} ago)"
    end
  end

  output
end

namespace :edition_audit_trail do
  limit = 5000

  task history_examples: [:environment] do
    actions = %W(Archived Created Deleted Draft Editioned Imported
                 Published Rejected Scheduled Submitted Superseded
                 Updated Withdrawn)

    Edition.all.limit(limit).each do |edition|
      edition.document_version_trail(superseded: false).reverse.each do |entry|
        action = entry.action.capitalize
        if actions.include? action
          puts audit_trail_entry(entry)
          actions.delete action
        end
      end
    end

    puts "Missing: #{actions.inspect}"
  end

  task unique_history_list: [:environment] do
    actions = []

    Edition.all.limit(limit).each do |edition|
      edition.document_version_trail.each do |entry|
        action = entry.action.capitalize
        actions << action unless actions.include? action
      end
    end

    puts actions.uniq.sort.inspect
  end

  task notes_examples: [:environment] do
    Edition.all.limit(limit).each do |edition|
      remarks = edition.document_remarks_trail.reverse
      puts render_editorial_remarks(remarks, edition)
    end
  end

  task fact_checking_examples: [:environment] do
    include ActionView::Helpers

    Edition.all.limit(limit).each do |edition|
      puts fact_check_responses(edition) if edition.can_be_fact_checked?
    end
  end

  task test: [:environment] do
    document = Document.last

    puts document.to_json(
      include: {
        editions: {
          include: :versions
        }
      }
    )
  end
end
