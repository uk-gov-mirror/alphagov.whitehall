class ConvertDatabaseToUtf8mb4 < ActiveRecord::Migration[5.1]
  # Only tables with a TEXT column have been chosen. This makes the migration quicker
  # and it also reduces the number of columns we need to limit to 191 characters, see
  # below. This does leave us in an inconsistent character set between the tables, but
  # at least the tables where users would be likely to UTF-8 characters will accept them.
  TABLES = %w[
    about_pages
    access_and_opening_times
    classifications
    contact_translations
    document_collection_groups
    document_collection_non_whitehall_links
    edition_translations
    editorial_remarks
    fact_check_requests
    fatality_notice_casualties
    featured_links
    force_publication_attempts
    govspeak_contents
    groups
    historical_accounts
    images
    operational_fields
    organisation_translations
    person_translations
    policy_groups
    promotional_feature_items
    responses
    role_translations
    sitewide_settings
    statistics_announcement_dates
    take_part_pages
    unpublishings
    world_location_translations
    worldwide_organisation_translations
  ].freeze

  def up
    # We have to limit the length of certain fields because they're indexed. The
    # version and configuration of MySQL we use doesn't support indexes on `utf8mb4`
    # `VARCHAR` fields longer than 191 characters.
    # https://github.com/rails/rails/issues/30305
    change_column :access_and_opening_times, :accessible_type, :string, limit: 191
    change_column :classifications, :slug, :string, limit: 191
    change_column :contact_translations, :locale, :string, limit: 191
    change_column :fact_check_requests, :key, :string, limit: 191
    change_column :groups, :slug, :string, limit: 191
    change_column :operational_fields, :slug, :string, limit: 191
    change_column :organisation_translations, :name, :string, limit: 191
    change_column :organisation_translations, :locale, :string, limit: 191
    change_column :person_translations, :locale, :string, limit: 191
    change_column :policy_groups, :slug, :string, limit: 191
    change_column :responses, :type, :string, limit: 191
    change_column :role_translations, :name, :string, limit: 191
    change_column :role_translations, :locale, :string, limit: 191
    change_column :take_part_pages, :slug, :string, limit: 191
    change_column :world_location_translations, :locale, :string, limit: 191
    change_column :worldwide_organisation_translations, :locale, :string, limit: 191

    # Convert the default character set for the tables. This automatically changes the
    # character set of the approriate columns as they use the default.
    TABLES.each do |table|
      execute "ALTER TABLE `#{table}` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    end
  end
end
