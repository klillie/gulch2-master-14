class AddMoreFieldsToSiteLoadProfiles < ActiveRecord::Migration
  def change
    add_column :site_load_profiles, :data_source, :string
    add_column :site_load_profiles, :all_usage, :decimal
    add_column :site_load_profiles, :on_peak_usage, :decimal
    add_column :site_load_profiles, :part_peak_usage, :decimal
    add_column :site_load_profiles, :off_peak_usage, :decimal
    add_column :site_load_profiles, :all_demand, :decimal
    add_column :site_load_profiles, :on_peak_demand, :decimal
    add_column :site_load_profiles, :part_peak_demand, :decimal
    add_column :site_load_profiles, :off_peak_demand, :decimal
  end
end
