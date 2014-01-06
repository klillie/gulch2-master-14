class CreateTariffBillGroups < ActiveRecord::Migration
  def change
    create_table :tariff_bill_groups do |t|
      t.string :bill_group_name
      t.integer :bill_group_order
      t.integer :tariff_billing_class_id

      t.timestamps
    end
  end
end
