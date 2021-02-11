Whitehall.edition_services.tap do |coordinator|
  coordinator.subscribe do |_event, edition, _options|
    puts "Arrived in general attachment service listener"

    ServiceListeners::AttachmentUpdater.call(attachable: edition)
  end

  coordinator.subscribe("unpublish") do |_event, edition, _options|
    puts "Arrived in unpublish service listener"

    # handling edition's dependency on other content
    edition.edition_dependencies.destroy_all

    # search
    ServiceListeners::SearchIndexer
      .new(edition)
      .remove!

    puts "#{edition}"
    # Update attachment redirect urls
    ServiceListeners::AttachmentRedirectUrlUpdater.call(attachable: edition)
  end

  coordinator.subscribe(/^(force_publish|publish|unwithdraw)$/) do |_event, edition, options|
    ServiceListeners::EditionDependenciesPopulator
      .new(edition)
      .populate!

    ServiceListeners::AttachmentDependencyPopulator
      .new(edition)
      .populate!

    # handling edition's dependency on other content
    edition.republish_dependent_editions

    ServiceListeners::AnnouncementClearer
      .new(edition)
      .clear!

    AuthorNotifierWorker.perform_async(edition.id, *[options[:user]&.id].compact)

    # Update attachment redirect urls
    ServiceListeners::AttachmentRedirectUrlUpdater.call(attachable: edition)
  end

  coordinator.subscribe(/^(force_publish|publish|withdraw|unwithdraw)$/) do |_event, edition, _options|
    ServiceListeners::SearchIndexer
      .new(edition)
      .index!
  end

  coordinator.subscribe(/^(force_publish|publish|unwithdraw|unpublish|withdraw)$/) do |_event, edition, options|
    ServiceListeners::EditorialRemarker
      .new(edition, options[:user], options[:remark])
      .save_remark!

    ServiceListeners::FeaturableOrganisationRepublisher
      .new(edition)
      .call
  end
end
