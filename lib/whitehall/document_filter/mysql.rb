require "whitehall/document_filter/filterer"

module Whitehall::DocumentFilter
  class Mysql < Filterer
    attr_accessor :documents

    def publications_search
      @documents = Publicationesque.published.includes(:document, :organisations)
      apply_filters
    end

    def announcements_search
      @documents = Announcement.published.includes(:document, :organisations)
      apply_filters
    end

    def apply_filters
      filter_by_locale!
      filter_by_location!
      apply_sort_direction!
      paginate!
    end

  private

    def filter_by_locale!
      @documents = @documents.with_translations(locale) if locale
    end

    def filter_by_location!
      if selected_locations.any?
        # we start from Announcement or Publicationesque, but not all
        # Publicationesque subtypes have a world_locations join (only
        # Publication does), so we have to do this join manually.
        @documents = @documents.joins("INNER JOIN `edition_world_locations` ON `edition_world_locations`.`edition_id` = `editions`.`id`
INNER JOIN `world_locations` ON `world_locations`.`id` = `edition_world_locations`.`world_location_id`")
        @documents = @documents.where(world_locations: { id: selected_locations.map(&:id) })
      end
    end

    def paginate!
      @documents = @documents.page(page).per(per_page)
    end

    def apply_sort_direction!
      @documents = @documents.in_reverse_chronological_order
    end
  end
end
