class RevalidateEditionBatchWorker
  include Sidekiq::Job
  sidekiq_options queue: "edition_revalidation", retry: 0, backtrace: false

  def perform(edition_ids)
    Edition.where(id: edition_ids).find_each do |edition|
      if edition.unpublished?
        if edition.unpublishing.valid?
          edition.update_column(:revalidated_at, Time.zone.now)
        end
      else
        edition.valid?(:publish) # revalidates the edition and updates `revalidated_at`
      end
    end
  end
end
