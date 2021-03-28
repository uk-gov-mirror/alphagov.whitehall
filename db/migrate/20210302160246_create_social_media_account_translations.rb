class CreateSocialMediaAccountTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :social_media_account_translations do |t|
      t.integer "social_media_account_id"
      t.string "locale", default: "en"
      t.string "url"
      t.string "title"

      t.timestamps null: false
    end
  end
end
