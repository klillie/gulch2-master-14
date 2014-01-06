require 'spec_helper'
require 'factory_girl_rails'

describe "Usage Fetcher pages" do

  	subject { page } 

	# => user sign in
	let(:user) { FactoryGirl.create(:user) }
    before { visit signin_path }
    	
    before do
       	fill_in "Email",        with: user.email
       	fill_in "Password",     with: user.password
       	click_button "Sign in"
    end

    describe "usage fetcher 'new' page" do

    	before { click_link "Get Usage" }

		it { should have_title('Get Usage') }
		it { should have_content('Get Usage') }
		it { should have_content('Account #') }
		it { should have_content('Zip Code') }
		it { should have_button('Submit All') }

		describe "when 'Submit All' clicked" do

			before { click_button "Submit All" }
		
			it { should have_selector('div.alert.alert-notice', text: "'Get Usage' is under development.") }

			it { should have_title('Get Usage') }
			it { should have_content('Get Usage') }
			it { should have_content('Account #') }
			it { should have_content('Zip Code') }
			it { should have_button('Submit All') }

		end

	end


end