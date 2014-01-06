class CreateTariffSettlementLoadProfiles < ActiveRecord::Migration
  def change
    create_table :tariff_settlement_load_profiles do |t|
      t.string :slp_date
      t.time :slp_time
      t.float :slp_factor
      t.integer :tariff_load_class_id

      t.timestamps
    end
  end
end
