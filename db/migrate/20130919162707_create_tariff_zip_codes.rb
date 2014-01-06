class CreateTariffZipCodes < ActiveRecord::Migration
  def change
    create_table :tariff_zip_codes do |t|
      t.string :zip_code

      t.timestamps
    end
  end
end
