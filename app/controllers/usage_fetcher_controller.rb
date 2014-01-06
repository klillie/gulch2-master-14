class UsageFetcherController < ApplicationController
	before_action :signed_in_user


	def create
		@usage_fetcher = UsageFetcher.new

		flash.now[:notice] = "'Get Usage' is under development.  Check back in a few weeks."
		render new_usage_fetcher_path
	end

	def new
		@usage_fetcher = UsageFetcher.new
	end

	def show
		#@usage_fetcher = UsageFetcher.new
	end

end