class SitesController < ApplicationController
	before_action :signed_in_user

	def new
		@site = Site.new
	end

	def create
		@site = Site.new(site_params)

		if @site.save
			flash[:notice] = 'New Site has been created.'
			redirect_to site_load_profile_path(@site)
		else
			render 'new'
		end
	end

	def destroy
	end


	def edit
		@site = Site.find(params[:id])
	end


	def select
		#for storing selected_site information
		@site = Site.find(params[:site_id])
		session[:selected_site_id] = @site.id
		session[:selected_site_load_profile_id] = nil
		#flash[:notice] = session[:selected_site_load_profile_id]
		redirect_to site_path(current_user)

	end

	def show
		#@site = Site.find(params[:id])
		#@user = User.find(params[:id])
	end

	def update
		@site = Site.find(params[:id])

		if @site.update_attributes(site_params)
			flash[:notice] = 'Site info has been updated.'
			redirect_to site_load_profile_path(@site)
		else
			render 'edit'
		end
	end

	private

	  	def site_params
	  		params.require(:site).permit(:site_name, :company, 
	  						:industry_type, :building_type, :description, 
	  						:address, :city, :state, :zip_code, :square_feet, 
	  						:phases, :user_id, :is_site_saved)
	  	end

end
