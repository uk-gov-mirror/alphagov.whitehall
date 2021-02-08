require "test_helper"

module Whitehall::DocumentFilter
  class MysqlTest < ActiveSupport::TestCase
    include DocumentFilterHelpers

    test "locale param filters content by locale" do
      filtered_scope = stub_document_scope("filtered scope")
      document_scope.expects(:with_translations).with("fr").returns(filtered_scope)
      create_filter(document_scope, locale: "fr")
    end

    test "locale param does not filter if no locale given" do
      document_scope.expects(:with_translations).never
      create_filter(document_scope, {})
    end

    test "can filter publications by location" do
      world_location = create(:world_location)
      other_world_location = create(:world_location)

      item1 = create(:published_publication, world_locations: [world_location])
      item2 = create(:published_statistical_data_set)
      item3 = create(:published_publication, world_locations: [other_world_location])
      item4 = create(:published_consultation)

      filter = Whitehall::DocumentFilter::Mysql.new(world_locations: [world_location.slug, other_world_location.slug])
      filter.publications_search
      assert_same_elements [item1, item3], filter.documents

      filter = Whitehall::DocumentFilter::Mysql.new(world_locations: [world_location.slug])
      filter.publications_search
      assert_same_elements [item1], filter.documents

      filter = Whitehall::DocumentFilter::Mysql.new(world_locations: [])
      filter.publications_search
      assert_same_elements [item1, item2, item3, item4], filter.documents

      filter = Whitehall::DocumentFilter::Mysql.new(world_locations: "all")
      filter.publications_search
      assert_same_elements [item1, item2, item3, item4], filter.documents
    end

    test "can filter announcements by location" do
      world_location = create(:world_location)
      other_world_location = create(:world_location)

      create(:published_news_article, news_article_type: NewsArticleType::NewsStory, world_locations: [world_location])
      create(:published_fatality_notice, world_locations: [world_location])
      create(:published_speech, speech_type: SpeechType::Transcript, world_locations: [world_location])
      create(:published_speech, speech_type: SpeechType::WrittenStatement, world_locations: [other_world_location])

      assert_equal 4, create_filter(Announcement.published, world_locations: [world_location.slug, other_world_location.slug]).documents.count
      assert_equal 3, create_filter(Announcement.published, world_locations: [world_location.slug]).documents.count
      assert_equal 1, create_filter(Announcement.published, world_locations: [other_world_location.slug]).documents.count
    end

    test "if page param given, returns a page of documents using page size of 20" do
      document_scope.expects(:page).with(3).returns(document_scope)
      document_scope.expects(:per).with(20).returns(document_scope)
      with_number_of_documents_per_page(20) do
        create_filter(document_scope, page: 3)
      end
    end

    test "allows combination of filter options" do
      organisation = stub_organisation("defra")
      topic = stub_topic("car-tax")

      document_scope.expects(:in_organisation).with([organisation]).returns(document_scope)
      document_scope.expects(:published_in_topic).with([topic]).returns(document_scope)
      document_scope.expects(:page).with(2).returns(document_scope)

      filter = create_filter(
        document_scope,
        departments: [organisation.slug],
        topics: [topic.slug],
        page: 2,
      )

      assert_equal [organisation], filter.selected_organisations
      assert_equal [topic], filter.selected_topics
    end

  private

    def create_filter(document_set, args)
      filter = Whitehall::DocumentFilter::Mysql.new(args)
      filter.documents = document_set
      filter.apply_filters
      filter
    end

    def document_scope
      @document_scope ||= stub_document_scope("unfiltered document scope")
    end

    def stub_document_scope(name)
      document_scope = stub(
        name,
        count: stub_everything,
        current_page: stub_everything,
        total_pages: stub_everything,
      )
      document_scope.stubs(:arel_table).returns(Edition.arel_table)
      document_scope.stubs(:without_editions_of_type).returns(document_scope)
      document_scope.stubs(:in_reverse_chronological_order).returns(document_scope)
      document_scope.stubs(:with_title_or_summary_containing).returns(document_scope)
      document_scope.stubs(:published_before).returns(document_scope)
      document_scope.stubs(:published_after).returns(document_scope)
      document_scope.stubs(:published_in_topic).returns(document_scope)
      document_scope.stubs(:in_organisation).returns(document_scope)
      document_scope.stubs(:where).with(has_entry(:publication_type_id, anything)).returns(document_scope)
      document_scope.stubs(:per).returns(document_scope)
      document_scope.stubs(:page).returns(document_scope)
      document_scope
    end

    def stub_topic(slug)
      topic = stub("topic-#{slug}", slug: slug, name: slug.humanize)
      Classification.stubs(:where).with(slug: [slug]).returns([topic])
      topic
    end

    def stub_organisation(slug)
      organisation = stub("organisation-#{slug}", slug: slug, name: slug.humanize)
      Organisation.stubs(:where).with(slug: [slug]).returns([organisation])
      organisation
    end

    def stub_publication_type(slug, attributes = {})
      publication_type = stub("publication-type-#{slug}", { id: slug, slug: slug, pluralized_name: slug.humanize.pluralize }.merge(attributes))
      PublicationType.stubs(:find_by_slug).with(slug).returns(publication_type)
      publication_type
    end

    def stub_publication_filter_option(label, attributes = {})
      publication_filter_option = stub(
        "publication-filter-option-#{label}",
        {
          label: label.humanize.pluralize,
          slug: label,
          publication_types: [stub_publication_type(label)],
          edition_types: [],
        }.merge(attributes),
      )
      Whitehall::PublicationFilterOption.expects(:find_by_slug).with(label).at_least_once.returns(publication_filter_option)
      publication_filter_option
    end
  end
end
