require 'spec_helper'
require 'factory_girl_rails'

describe "Site" do

	let(:user) { FactoryGirl.create(:user) }
	before { @site = user.sites.build(site_name: "Test Site", company: "Acme Inc.", industry_type: "Commercial",
								building_type: "Office", description: "Standard office building", 
								address: "123 Main St", city: "Any Town", state: "IL", 
								zip_code: "60607", square_feet: "3000", phases: "3-phase",
								is_site_saved: "0") }

	#let!(:site) { FactoryGirl.create(:site, user: @user) }

	subject { @site }

	it { should respond_to(:site_name) }
	it { should respond_to(:company) }
	it { should respond_to(:industry_type) }
	it { should respond_to(:building_type) }
	it { should respond_to(:description) }
	it { should respond_to(:address) }
	it { should respond_to(:city) }
	it { should respond_to(:state) }
	it { should respond_to(:zip_code) }
	it { should respond_to(:square_feet) }
	it { should respond_to(:phases) }
	it { should respond_to(:user_id) }
	its(:user) { should eq user }
	it { should respond_to(:is_site_saved) }

	it { should be_valid }

	# should only be required when site is being saved
	#describe "when a site_name is not present" do
	#	before { @site.site_name = " " }
	#	it { should_not be_valid }
	#end

# zip_code	
	describe "when a zip_code is not present" do
		before { @site.zip_code = " " }
		it { should_not be_valid } 
	end

	describe "when zip_code is too long" do
		before { @site.zip_code = "1" * 6 }
		it { should_not be_valid }
	end

	describe "when zip_code is too short" do
		before { @site.zip_code = "1" * 4 }
		it { should_not be_valid }
	end

	describe "when zip_code is not numbers" do
		before { @site.zip_code = "a" * 5 }
		it { should_not be_valid }
	end

# square_feet
#	describe "when square_feet is not a number" do
#		before { @site.square_feet = "square feet" }
#		it { should_not be_valid }
#	end

# user_id
	describe "when user_id is not present" do
		before { @site.user_id = nil }
		it { should_not be_valid }
	end

end
