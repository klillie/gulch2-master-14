class CreateTariffMuniFranchiseCosts < ActiveRecord::Migration
  def change
    create_table :tariff_muni_franchise_costs do |t|
      t.string :fca_city
      t.float :fca_rate
      t.integer :tariff_line_item_id

      t.timestamps
    end
  end
end
