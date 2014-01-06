class CreateTariffHolidays < ActiveRecord::Migration
  def change
    create_table :tariff_holidays do |t|
      t.string :holiday_name
      t.date :holiday_date
      t.integer :tariff_territory_id

      t.timestamps
    end
  end
end
