class CreateTariffLoadClasses < ActiveRecord::Migration
  def change
    create_table :tariff_load_classes do |t|
      t.string :load_class_name
      t.string :customer_type
      t.string :voltage
      t.string :load_class_units
      t.float :load_class_start
      t.float :load_class_end
      t.string :weather_zone
      t.integer :tariff_territory_id

      t.timestamps
    end
  end
end
