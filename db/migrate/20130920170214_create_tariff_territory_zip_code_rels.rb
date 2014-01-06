class CreateTariffTerritoryZipCodeRels < ActiveRecord::Migration
  def change
    create_table :tariff_territory_zip_code_rels do |t|
      t.integer :tariff_territory_id
      t.integer :tariff_zip_code_id

      t.timestamps
    end
  end
end
