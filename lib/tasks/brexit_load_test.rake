desc "creates and schedules 3000 editions for brexit load testing"
task :brexit_load_test, [:date] => :environment do |_, args|
  date = args[:date] ? args[:date] : Time.zone.now + 1.hour
  creator = User.find_by_uid("daae32d0-37e6-0135-a6f8-00505601092e")

  puts "Creating 3000 documents"
  document_ids = 3000.times.map do |n|
    Document.create!(
      content_id: SecureRandom.uuid,
      document_type: "NewsArticle"
    ).id
  end

  puts "Creating 3000 editions + relations"
  editions = document_ids.map.with_index do |document_id, index|
    NewsArticle.create!(
      title: "Callum and Peter's load test - #{index}", summary: "Load test", body: "Load test", creator: creator,
      previously_published: false, news_article_type_id: 1, lead_organisations: [creator.organisation],
      scheduled_publication: date, document_id: document_id
    )
  end

  puts "Adding links, persisting draft editions in Publishing API and scheduling them"
  editions.each do |edition|
    ## Add Brexit taxon for publishing
    Services.publishing_api.patch_links(edition.content_id, { links: { taxons: ["d6c2de5d-ef90-45d1-82d4-5f2438369eea"] } })

    ## Add edition to publishing api (put content)
    Whitehall.edition_services.draft_updater(edition).perform!

    ## Schedule edition
    Whitehall.edition_services.force_scheduler(edition).perform!
  end
end
