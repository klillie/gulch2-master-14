class CreateTariffIsoLmps < ActiveRecord::Migration
  def change
    create_table :tariff_iso_lmps do |t|
      t.string :iso_rto
      t.string :hub
      t.string :da_rt

      t.timestamps
    end
  end
end
