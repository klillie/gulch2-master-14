class CreateSiteLoadProfiles < ActiveRecord::Migration
  def change
    create_table :site_load_profiles do |t|
      t.date :meter_read_date
      t.string :tou
      t.decimal :demand
      t.decimal :usage
      t.datetime :interval_date_time

      t.timestamps
    end
  end
end
