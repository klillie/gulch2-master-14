class AddIsSiteSavedToSite < ActiveRecord::Migration
  def change
    add_column :sites, :is_site_saved, :boolean
  end
end
