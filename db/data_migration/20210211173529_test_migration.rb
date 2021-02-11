beis_redirects = [
  { govuk_page: "https://www.staging.publishing.service.gov.uk/government/publications/peters-test", target_url: "https://etl.beis.gov.uk/products/automatic-monitoring-targeting-amt/automatic-monitoring-targeting-amt-sub-metering-systems" },
]

judiciary_redirects = [
]

(judiciary_redirects + beis_redirects).each do |redirect|
  slug = URI.parse(redirect[:govuk_page]).path.split("/").last

  # Peter H
  user = User.find(8627)

  published_edition = Document.find_by(slug: slug)&.published_edition

  unless published_edition
    puts "No published edition for GOV.UK page: #{redirect[:govuk_page]}"
    next
  end

  if (pre_pub_edition = published_edition.other_editions.in_pre_publication_state.first)
    edition_deleter = Whitehall.edition_services.deleter(pre_pub_edition)

    if edition_deleter.perform!
      puts "Draft deleted with URL: #{redirect[:govuk_page]}"
    else
      puts edition_deleter.failure_reason
    end
  end

  unpublishing_params = {
    unpublishing_reason_id: UnpublishingReason::Consolidated.id,
    alternative_url: redirect[:target_url],
    redirect: true,
  }

  edition_unpublisher = Whitehall.edition_services.unpublisher(
    published_edition, user: user, remark: "Reset to draft", unpublishing: unpublishing_params
  )

  if edition_unpublisher.perform!
    puts "Redirect successful from: #{redirect[:govuk_page]} to: #{redirect[:target_url]}"
  else
    puts edition_unpublisher.failure_reason
  end
end
