class DetailedGuide < Edition
  include Edition::Images
  include Edition::NationalApplicability
  include Edition::Topics
  include ::Attachable
  include Edition::AlternativeFormatProvider
  include Edition::FactCheckable
  include Edition::HasMainstreamCategories
  include Edition::HasDocumentCollections
  include Edition::Organisations
  include Edition::RelatedPolicies

  delegate :section, :subsection, :subsubsection, to: :primary_mainstream_category, allow_nil: true

  class Trait < Edition::Traits::Trait
    def process_associations_after_save(edition)
      edition.outbound_related_documents = @edition.outbound_related_documents
    end
  end

  has_many :edition_relations, foreign_key: :edition_id, dependent: :destroy, class_name: 'EditionRelation'
  has_many :outbound_related_documents, through: :edition_relations, source: :document
  has_many :outbound_related_detailed_guides, through: :edition_relations, source: :document, conditions: { document_type: "DetailedGuide" }

  add_trait Trait

  validate :related_mainstream_content_valid?
  validate :additional_related_mainstream_content_valid?

  class HeadingHierarchyValidator < ActiveModel::Validator
    include GovspeakHelper
    def validate(record)
      govspeak_header_hierarchy(record.body)
    rescue OrphanedHeadingError => e
      record.errors.add(:body, "must have a level-2 heading (h2 - ##) before level-3 heading (h3 - ###): '#{e.heading}'")
    end
  end

  validates_with HeadingHierarchyValidator

  def rummager_index
    :detailed_guides
  end

  def published_related_detailed_guides
    (published_outbound_related_detailed_guides + published_inbound_related_detailed_guides).uniq
  end

  def can_be_related_to_mainstream_content?
    true
  end

  def has_related_mainstream_content?
    related_mainstream_content_url.present?
  end

  def has_additional_related_mainstream_content?
    additional_related_mainstream_content_url.present?
  end

  def display_type
    "Detailed guide"
  end

  def display_type_key
    "detailed_guidance"
  end

  def search_format_types
    super + [DetailedGuide.search_format_type]
  end
  def self.search_format_type
    'detailed-guidance'
  end

  private

  # Returns the published edition of any detailed guide documents that this edition is related to.
  def published_outbound_related_detailed_guides
    outbound_related_detailed_guides.published.map { |document| document.published_edition }
  end

  # Returns the published editions that are related to this edition's document.
  def published_inbound_related_detailed_guides
    DetailedGuide.published.joins(:edition_relations).where(edition_relations: { document_id: document.id })
  end

  def related_mainstream_content_valid?
    if related_mainstream_content_url.present? && related_mainstream_content_title.blank?
      errors.add(:related_mainstream_content_title, "cannot be blank if a related URL is given")
    end
  end

  def additional_related_mainstream_content_valid?
    if additional_related_mainstream_content_url.present? && additional_related_mainstream_content_title.blank?
      errors.add(:additional_related_mainstream_content_title, "cannot be blank if an additional related URL is given")
    end
  end

  def self.format_name
    'detailed guidance'
  end
end
