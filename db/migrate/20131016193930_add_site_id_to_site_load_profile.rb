class AddSiteIdToSiteLoadProfile < ActiveRecord::Migration
  def change
    add_column :site_load_profiles, :site_id, :integer
  end
end
