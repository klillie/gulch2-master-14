class CreateTariffLmpRates < ActiveRecord::Migration
  def change
    create_table :tariff_lmp_rates do |t|
      t.date :lmp_date
      t.time :lmp_time
      t.float :lmp_factor
      t.integer :tariff_iso_lmp_id

      t.timestamps
    end
  end
end
