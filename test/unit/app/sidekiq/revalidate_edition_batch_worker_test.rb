require "test_helper"

class RevalidateEditionBatchWorkerTest < ActiveSupport::TestCase
  test "calls `valid?(:publish)` on the given editions" do
    edition1 = create(:edition)
    edition2 = create(:edition)

    Edition.any_instance.expects(:valid?).with(:publish).twice

    RevalidateEditionBatchWorker.new.perform([edition1.id, edition2.id])
  end

  test "sets the revalidated_at attribute to the current time if the edition is unpublished with a valid unpublishing" do
    edition = create(:unpublished_edition)
    Timecop.freeze(Time.zone.now) do
      RevalidateEditionBatchWorker.new.perform([edition])
      assert_equal Time.zone.now, edition.reload.revalidated_at
    end
  end

  test "does not set the revalidated_at attribute to the current time if the edition is unpublished with an invalid unpublishing" do
    edition = create(:unpublished_edition)
    edition.unpublishing.alternative_url = "https://some invalid url"
    edition.unpublishing.save!(validate: false)
    Timecop.freeze(Time.zone.now) do
      RevalidateEditionBatchWorker.new.perform([edition])
      assert_equal nil, edition.reload.revalidated_at
    end
  end
end
