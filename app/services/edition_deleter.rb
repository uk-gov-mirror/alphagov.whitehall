class EditionDeleter < EditionService
  def verb
    "delete"
  end

  def past_participle
    "deleted"
  end

  def can_transition?
    edition.public_send("can_#{verb}?") &&
      edition.unpublishing.nil?
  end

  def failure_reason
    if !edition.unpublishing.nil?
      "A draft edition cannot be deleted if it has been unpublished"
    elsif !edition.public_send("can_#{verb}?")
      "An edition that is #{edition.current_state} cannot be deleted"
    end
  end

private

  def fire_transition!
    edition.public_send(verb)
    edition.save!(validate: false)
    edition.delete_all_attachments if edition.respond_to?(:delete_all_attachments)
  end

  def update_publishing_api!
    super
    # We need the editions URL as part of the deletion process so we can't
    # clear the slug until we've updated the Publishing API.
    edition.clear_slug
  end
end
