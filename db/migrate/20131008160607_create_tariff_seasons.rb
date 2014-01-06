class CreateTariffSeasons < ActiveRecord::Migration
  def change
    create_table :tariff_seasons do |t|
      t.string :season_type
      t.date :season_start_date
      t.date :season_end_date
      t.integer :tariff_territory_id

      t.timestamps
    end
  end
end
