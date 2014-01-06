require 'spec_helper'

describe "Static Pages" do
  
	subject { page }

	describe "Home page" do

		before { visit root_path }

		it { should have_content('Gulch Solutions') }
		
		it { should have_content('View Demo') }
		it { should have_content('Contact') }
		it { should have_content('Sign In') }

		it { should_not have_content('Profile') }
		it { should_not have_content('Bill Comparison') }
		it { should_not have_content('Sign Out') }
		
	end

	describe "Company page" do
	
		before { visit company_path }

		it { should have_content('About Us') }
		it { should have_content('J.S. Roy') }
		it { should have_content('Kevin Lillie') }

		it { should have_content('View Demo') }
		it { should have_content('Contact') }
		it { should have_content('Sign In') }

		it { should_not have_content('Profile') }
		it { should_not have_content('Bill Comparison') }
		it { should_not have_content('Sign Out') }
		
	end

	describe "Contact page" do

		before { visit contact_path }

		it { should have_content('email') }
#		it { should have_content('info@gulchsolutions.com') }
#		it { should have_content('call') }
#		it { should have_content('630-248-0777') }
	
		it { should have_content('View Demo') }
		it { should have_content('Contact') }
		it { should have_content('Sign In') }

		it { should_not have_content('Profile') }
		it { should_not have_content('Bill Comparison') }
		it { should_not have_content('Sign Out') }
	end

end
