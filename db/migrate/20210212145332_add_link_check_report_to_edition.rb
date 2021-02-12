class AddLinkCheckReportToEdition < ActiveRecord::Migration[6.0]
  def change
    add_reference :editions, :link_check_report, foreign_key: true
  end
end
