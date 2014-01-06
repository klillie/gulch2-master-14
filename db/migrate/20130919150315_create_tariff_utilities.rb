class CreateTariffUtilities < ActiveRecord::Migration
  def change
    create_table :tariff_utilities do |t|
      t.string :utility_name
      t.string :state

      t.timestamps
    end
  end
end
