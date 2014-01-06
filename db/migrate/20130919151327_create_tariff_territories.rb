class CreateTariffTerritories < ActiveRecord::Migration
  def change
    create_table :tariff_territories do |t|
      t.string :territory_name
      t.integer :tariff_utility_id

      t.timestamps
    end
    add_index :tariff_territories, [:tariff_utility_id]
  end
end
