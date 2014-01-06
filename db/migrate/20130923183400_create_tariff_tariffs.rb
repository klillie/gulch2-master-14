class CreateTariffTariffs < ActiveRecord::Migration
  def change
    create_table :tariff_tariffs do |t|
      t.string :tariff_name
      t.string :tariff_type
      t.integer :tariff_billing_class_id

      t.timestamps
    end
  end
end
