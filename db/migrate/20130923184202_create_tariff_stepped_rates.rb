class CreateTariffSteppedRates < ActiveRecord::Migration
  def change
    create_table :tariff_stepped_rates do |t|
      t.string :stepped_rates_unit
      t.float :stepped_rates_start
      t.float :stepped_rates_end
      t.float :stepped_rates_rate
      t.string :stepped_rates_city
      t.integer :tariff_line_item_id

      t.timestamps
    end
  end
end
