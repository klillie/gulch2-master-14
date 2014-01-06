class AddPhasesSizeToSite < ActiveRecord::Migration
  def change
    add_column :sites, :square_feet, :decimal
    add_column :sites, :phases, :string
  end
end
