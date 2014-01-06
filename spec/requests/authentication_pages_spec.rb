require 'spec_helper'
require 'factory_girl_rails'

describe "Authentication" do

	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_title('Sign In') }
		it { should have_link('Sign up now!')}
	end

	describe "sign in" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_title('Sign In') }
			it { should have_link('Sign up now!')}
			it { should have_selector('div.alert.alert-notice', text: 'Invalid email/password combination!') }

			describe "after visiting another page" do
				before { click_link "Company" }
				it { should_not have_selector('div.alert.alert-error') }
			end		
		end

		describe "with valid information" do
			before { visit signin_path }

			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", 	with: user.email.upcase
				fill_in "Password",	with: user.password
				click_button "Sign in"
			end

#			it { should have_link('Profile', 		href: user_path(user)) }
			it { should have_link('Sign Out',		href: signout_path) }
			it { should_not have_link('Sign in', 	href: signin_path) }
			it { should_not have_content('Sign in') }

			describe "followed by signout" do
				before { click_link 'Sign Out' }
				it { should have_link('Sign In') }
				it { should have_title('Sign In') }
			end
		end
	end

	describe "authorization" do

		describe "for non-signed-in users" do
			let(:user) { FactoryGirl.create(:user) }

#			describe "in the Users controller" do

#				describe "visiting the edit page" do
#					before { visit edit_user_path(user) }
#					it { should have_title('Sign in') }
#				end

#				describe "submitting to the update action" do
#					before { patch user_path(user) }
#					specify { expect(response).to redirect_to(signin_path) }
#				end
#			end

			describe "in the TariffTools controller" do

				describe "visiting the input page" do
					before { visit input_path }
					it { should have_title('Sign In') }
				end
			
				describe "visiting the tool page" do
					before { visit tool_path }
					it { should have_title('Sign In') }
				end

			end

			describe "in the Sites controller" do

				describe "submitting to the create action" do
					before { post sites_path }
					specify { expect(response).to redirect_to(signin_path) }
				end

				describe "submitting to the destroy action" do
					before { delete site_path(FactoryGirl.create(:site)) }
					specify { expect(response).to redirect_to(signin_path) }
				end

			end

		end

		describe "as wrong user" do
			let(:user) { FactoryGirl.create(:user) }
			let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") } 
			before { sign_in user, no_capybara: true }

#			describe "submitting a GET request to the Users#edit action" do
#				before { get edit_user_path(wrong_user) }
#				specify { expect(response.body).not_to match(full_title('Edit user')) }
#				specify { expect(response).to redirect_to(signin_path) }
#			end

#			describe "submitting a PATCH request to the Users#update action" do
#				before { patch user_path(wrong_user) }
#				specify { expect(response).to redirect_to(signin_path) }
#			end
		end
	end
end
