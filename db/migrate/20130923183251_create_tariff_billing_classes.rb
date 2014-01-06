class CreateTariffBillingClasses < ActiveRecord::Migration
  def change
    create_table :tariff_billing_classes do |t|
      t.string :billing_class_name
      t.string :customer_type
      t.string :phases
      t.string :voltage
      t.string :units
      t.float :start_value
      t.float :end_value
      t.integer :tariff_territory_id

      t.timestamps
    end
  end
end
