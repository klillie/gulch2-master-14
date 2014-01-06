class CreateUsageFetchers < ActiveRecord::Migration
  def change
    create_table :usage_fetchers do |t|
      t.string :account_no
      t.string :zip_code

      t.timestamps
    end
  end
end
