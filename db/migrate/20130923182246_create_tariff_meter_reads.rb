class CreateTariffMeterReads < ActiveRecord::Migration
  def change
    create_table :tariff_meter_reads do |t|
      t.date :meter_read_date
      t.string :billing_month
      t.string :billing_year
      t.integer :tariff_territory_id

      t.timestamps
    end
  end
end
