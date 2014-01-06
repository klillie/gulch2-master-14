class CreateTariffIndexedRates < ActiveRecord::Migration
  def change
    create_table :tariff_indexed_rates do |t|
      t.float :additional_charge
      t.integer :tariff_line_item_id
      t.integer :tariff_iso_lmp_id

      t.timestamps
    end
  end
end
