require "test_helper"
require "gds_api/test_helpers/publishing_api"

class PublishingApiDiscardDraftWorkerTest < ActiveSupport::TestCase
  include GdsApi::TestHelpers::PublishingApi

  def setup
    @edition = create(:draft_case_study)
    WebMock.reset!
    @successful_discard_request = stub_publishing_api_discard_draft(@edition.content_id)
  end

  test "calls discard draft on the publishing api" do
    PublishingApiDiscardDraftWorker.new.perform(@edition.content_id, "en")

    assert_requested @successful_discard_request
  end

  test "gracefully handles the deletion of an already-deleted draft edition" do
    request = stub_any_publishing_api_call
      .to_return(status: 422)

    PublishingApiDiscardDraftWorker.new.perform(@edition.content_id, "en")

    assert_requested request
  end

  test "gracefully handles the deletion of a non-existant content item" do
    request = stub_any_publishing_api_call_to_return_not_found

    PublishingApiDiscardDraftWorker.new.perform(@edition.content_id, "en")

    assert_requested request
  end

  test "un-reserves a base path when provided with one" do
    request = stub_publishing_api_unreserve_path("/path-to-unreserve", "whitehall")

    PublishingApiDiscardDraftWorker.new.perform(@edition.content_id, "en", "/path-to-unreserve")

    assert_requested request
  end

  test "gracefully handles unreserving a path that is not known to the Publishing API" do
    request = stub_publishing_api_unreserve_path_not_found("/path-to-unreserve", "whitehall")

    PublishingApiDiscardDraftWorker.new.perform(@edition.content_id, "en", "/path-to-unreserve")

    assert_requested request
  end

  test "gracefully handles unreserving a path that is reserved by a different app" do
    request = stub_publishing_api_unreserve_path_invalid("/path-to-unreserve", "whitehall")

    PublishingApiDiscardDraftWorker.new.perform(@edition.content_id, "en", "/path-to-unreserve")

    assert_requested request
  end

  test "raises an error if an edition's document is locked" do
    edition = create(:unpublished_edition, :with_locked_document)
    assert_raises LockedDocumentConcern::LockedDocumentError, "Cannot perform this operation on a locked document" do
      PublishingApiDiscardDraftWorker.new.perform(edition.content_id, "en")
    end
  end
end
