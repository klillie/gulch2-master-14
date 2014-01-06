class TariffToolsController < ApplicationController
	before_action :signed_in_user

	def new
	end

	def change_site_load_profile
		@site_id = params[:site_id]
		@selected_site_load_profile_id = session[:selected_site_load_profile_id]

		if params[:next_or_previous] == 'previous'

			#flash[:notice] = SiteLoadProfile.get_previous(@site_id,
			#	@selected_site_load_profile_id)

			session[:selected_site_load_profile_id] = SiteLoadProfile.get_previous(@site_id,
				@selected_site_load_profile_id)
			flash[:notice] = session[:selected_site_load_profile_id]

		elsif params[:next_or_previous] == "next"

			session[:selected_site_load_profile_id] = SiteLoadProfile.get_next(@site_id, 
				@selected_site_load_profile_id)

		else
			#trap if this happens
			flash[:notice] = params[:next_or_previous]
			
		end

		# run standard "tool" verifications
		flash[:notice] = "Electricity bill for new month has been created."
		tool	
		

	end

	def tool

		if session[:selected_site_id].nil?
			flash[:notice] = "No Site currently selected.  Input Site data below, or select an existing Site by 
				clicking on 'Sites' above."		
			redirect_to '/input'
		
		else
			    
			# find the right info based on the :selected_site_id
			@site = Site.find(session[:selected_site_id])
			@zip = @site.zip_code
			@phases = @site.phases

			if session[:selected_site_load_profile_id].nil?
# => fix -> make controller skinny!
				# find all the site_load_profiles for the give site, 
				#    and select the one with the most recent meter_read_date
				@site_load_profile = SiteLoadProfile.find_all_load_profiles(@site.id).last

				if @site_load_profile.nil?
					flash[:notice] = "No Load Profile data exists for currently selected Site.  
						Input Site Load Profile data below."		
					redirect_to site_load_profile_path(@site)

					# makes it so rest of code below is not executed if condition is met
					return	

				else
					
					session[:selected_site_load_profile_id] = @site_load_profile.id

					@demand = @site_load_profile.all_demand
					@usage = @site_load_profile.all_usage
					@date = @site_load_profile.meter_read_date
					
				end

			else
				# finds the site_load_profile based on the selected_site_load_profile_id store in session
				@site_load_profile = SiteLoadProfile.find(session[:selected_site_load_profile_id])

				@demand = @site_load_profile.all_demand
				@usage = @site_load_profile.all_usage
				@date = @site_load_profile.meter_read_date
				
			end

			if TariffZipCode.zip_code(@zip).nil?
				TariffMailer.zip_db_missing(@site).deliver
				flash[:notice] = "Zip Code is currently not supported. 
					Please contact sales@gulchsolutions.com for more information."

				# checks to see if data comes from input or sites, and returns the user to that respective area
				if @site.is_site_saved
					redirect_to site_load_profile_path(@site)
				else
				   	redirect_to '/input'
				end
				    
		    elsif (TariffTerritory.territory(@zip).nil? || TariffUtility.utility(@zip).nil? || 
		    		(TariffSeason.season(@date, @zip).count < 2) || 
		    		(TariffBillingClass.billing_class(@zip, @demand, @usage, @phases).count != 1) )

		    	TariffMailer.database_error(@site, @site_load_profile).deliver
				flash[:notice] = "Data input has returned an error.  Verify the data input and try again. 
					Contact support@gulchsolutions.com for more details. Error 1"
		    	#flash[:notice] = "Data input has resulted in an invalid Territory, Utility, Season, or Billing Class."

				# checks to see if data comes from input or sites, and returns the user to that respective area
				if @site.is_site_saved
					redirect_to site_load_profile_path(@site)
				else
			    	redirect_to '/input'
			   	end

			else 

		    	@territory = TariffTerritory.territory(@zip)
				@utility = TariffUtility.utility(@zip)
				@season = TariffSeason.season(@date, @zip)
				@billing_class = TariffBillingClass.billing_class(@zip, @demand, @usage, @phases)

				if (TariffTou.tou(@date, @zip).nil? || TariffMeterRead.meter_read(@date, @zip).nil? ||
					TariffTariff.tariffs(@billing_class).nil? || TariffBillGroup.bill_groups(@billing_class).nil?)

					TariffMailer.database_error(@site, @site_load_profile).deliver
					flash[:notice] = "Data input has returned an error.  Verify the data input and try again.  
						Contact support@gulchsolutions.com for more details."
			    	#flash[:notice] = "Data input has resulted in an invalid Tariff or Bill Group."

					# checks to see if data comes from input or sites, and returns the user to that respective area
					if @site.is_site_saved
						redirect_to site_load_profile_path(@site)
					else
				    	redirect_to '/input'
				   	end

				else

					@meter_read = TariffMeterRead.meter_read(@date, @zip)
					@tou = TariffTou.tou(@date, @zip)
					@tariffs = TariffTariff.tariffs(@billing_class)
					@bill_groups = TariffBillGroup.bill_groups(@billing_class)

					if TariffLineItems.line_items(@tariffs, @date, @season).nil?

						TariffMailer.database_error(@site, @site_load_profile).deliver
						flash[:notice] = "Data input has returned an error.  Verify the data input and try again.  
							Contact support@gulchsolutions.com for more details."
				    	#flash[:notice] = "Data input has resulted in an invalid Line Items."

						# checks to see if data comes from input or sites, and returns the user to that respective area
						if @site.is_site_saved
							redirect_to site_load_profile_path(@site)
						else
				    		redirect_to '/input'
				    	end

				    else
						
				    	flash.now[:notice] = "New electricity bill has been re-created."
				    	render 'tool'
				    	
				    end

			    end

			end
				
		end

	end


	def create

# => fix!	user_id should be based on the currently signed in user, and not on a user_id of '1'
		@site = Site.new(zip_code: params[:site][:zip_code], phases: params[:site][:phases],
							user_id: "1")

		# checks to make sure site can be saved
		if @site.save 

			@site_load_profile = SiteLoadProfile.new(meter_read_date: params[:site_load_profile][:meter_read_date],
						data_source: params[:site_load_profile][:data_source], 
						all_usage: params[:site_load_profile][:all_usage], 
						all_demand: params[:site_load_profile][:all_demand], 
						site_id: @site.id)
			
			# checks to make sure site_load_profile can be saved
			if @site_load_profile.save
				
				# sets selected_site_id and selected_site_load_profile_id to newly created site and site_load_profile
				session[:selected_site_id] = @site.id
				session[:selected_site_load_profile_id] = @site_load_profile.id

				# show Bill Comparison page
				redirect_to tool_path
					
			else
				#redirect_to '/input'
				render 'input'
			end

		end

	end
	
	def index
	end

	def input
		@site = Site.new
		@site_load_profile = SiteLoadProfile.new
	end

end
