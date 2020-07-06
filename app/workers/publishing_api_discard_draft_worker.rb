class PublishingApiDiscardDraftWorker < PublishingApiWorker
  def perform(content_id, locale, base_path_to_unreserve = nil)
    check_if_locked_document(content_id: content_id)

    discard_draft(content_id, locale)
    unreserve_path(base_path_to_unreserve) if base_path_to_unreserve
  end

private

  def unreserve_path(base_path)
    Services.publishing_api.unreserve_path(base_path, "whitehall")
  rescue GdsApi::HTTPNotFound, GdsApi::HTTPUnprocessableEntity
    # Path may already be discarded or now owned by a different application,
    # we don't need to do anything in those scenarios
    nil
  end

  def discard_draft(content_id, locale)
    Services.publishing_api.discard_draft(content_id, locale: locale)
  rescue GdsApi::HTTPNotFound, GdsApi::HTTPUnprocessableEntity
    # nothing to do here as the draft has already been deleted
    # this shouldn't really happen but can still occur due to inconsistencies
    # between this app's data and what's in the Content Store/Publishing API
    nil
  end
end
