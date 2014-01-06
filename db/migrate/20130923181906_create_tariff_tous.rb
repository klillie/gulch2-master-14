class CreateTariffTous < ActiveRecord::Migration
  def change
    create_table :tariff_tous do |t|
      t.string :tou_type
      t.string :day_of_week
      t.time :start_time
      t.time :end_time
      t.integer :tariff_seasons_id

      t.timestamps
    end
  end
end
