class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			
			#for storing selected_site information
			session[:selected_site_id] = nil
			session[:selected_site_load_profile_id] = nil
			
			redirect_to user_path(user)
		else
			flash.now[:notice] = 'Invalid email/password combination!'
			render 'new'
		end
	end

	def destroy
		sign_out

		#removes the selected_site information from the session
		session[:selected_site_id] = nil
		session[:selected_site_load_profile_id] = nil
		
		flash[:notice] = 'You have signed out.'
		redirect_to signin_path
	end

end
