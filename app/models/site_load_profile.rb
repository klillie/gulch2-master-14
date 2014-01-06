class SiteLoadProfile < ActiveRecord::Base
	belongs_to :site

	validates :meter_read_date, presence: true	
	#validates :tou, presence: false	
	validates :data_source, presence: true	
	
	validates :all_usage, presence: true, numericality: true
	validates :all_demand, presence: true, numericality: true
	#validates :on_peak_usage, presence: false, numericality: true
	#validates :on_peak_demand, presence: false, numericality: true
	#validates :part_peak_usage, presence: false, numericality: true
	#validates :part_peak_demand, presence: false, numericality: true
	#validates :off_peak_usage, presence: false, numericality: true
	#validates :off_peak_demand, presence: false, numericality: true
	
	validates :site_id, presence: true


	def self.new_or_update(site_id, meter_read_date)
		@load_profile_check = SiteLoadProfile.where('site_id = ? 
							AND meter_read_date = ?', 
							site_id, meter_read_date)

		@data_status = Hash.new

		if @load_profile_check.count == 0
			@data_status = { :status => 'new', :id => nil }
		elsif @load_profile_check.count == 1
			#@new_or_update = { :status => 'update', :id => @load_profile_check.id }
			@data_status = { :status => 'update', :id => @load_profile_check.first.id }

		else
			# this is a big problem; 
			# => support needs to be aware and database needs to be fixed
			@data_status = { :status => 'error', :id => '999'}
		end

	end

	def self.find_all_load_profiles(site_id)
		@all_site_load_profiles = SiteLoadProfile.where('site_id = ?', site_id)

		@all_site_load_profiles.sort_by{ |a| a.meter_read_date }

	end

	def self.check_next(site_id, selected_site_load_profile_id)
		@list_site_load_profiles = SiteLoadProfile.find_all_load_profiles(site_id)

		if selected_site_load_profile_id != @list_site_load_profiles.last.id
			true
		else
			false
		end

	end

	def self.check_previous(site_id, selected_site_load_profile_id)
		@list_site_load_profiles = SiteLoadProfile.find_all_load_profiles(site_id)

		if selected_site_load_profile_id != @list_site_load_profiles.first.id
			true
		else
			false
		end
	end

	def self.get_next(site_id, selected_site_load_profile_id)
		@list_site_load_profiles = SiteLoadProfile.find_all_load_profiles(site_id)

		@current_index = @list_site_load_profiles.index{ |item| item.id == selected_site_load_profile_id }

		@previous_site_load_profile_id = @list_site_load_profiles[@current_index + 1].id
	end

	def self.get_previous(site_id, selected_site_load_profile_id)
		@list_site_load_profiles = SiteLoadProfile.find_all_load_profiles(site_id)

		@current_index = @list_site_load_profiles.index{ |item| item.id == selected_site_load_profile_id }

		@previous_site_load_profile_id = @list_site_load_profiles[@current_index - 1].id

	end

end
