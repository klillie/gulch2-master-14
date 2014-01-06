require 'spec_helper'
require 'factory_girl_rails'

describe "Tariff Tool pages" do
  
	subject { page } 

	let(:user) { FactoryGirl.create(:user) }
    before { visit signin_path }
    	
    before do
       	fill_in "Email",        with: user.email
       	fill_in "Password",     with: user.password
       	click_button "Sign in"
    end

	# sets up tariff_tool data in the database so tariff_tool will work properly
	let(:utility) 				{ FactoryGirl.create(:tariff_utility) }
	let(:territory) 			{ FactoryGirl.create(:tariff_territory, tariff_utility: utility) }
	let(:zip_code) 				{ FactoryGirl.create(:tariff_zip_code) }
	#let(:territory_zip)	{ FactoryGirl.create(:tariff_territory_zip_code_rel, 
	#								tariff_territory: territory, tariff_zip_code: zip_code) }
	let(:season_all)			{ FactoryGirl.create(:tariff_season_all, tariff_territory: territory) }
	let(:season_winter)			{ FactoryGirl.create(:tariff_season_winter, tariff_territory: territory) }
	#let(:meter_read_october)	{ FactoryGirl.create(:tariff_meter_read_october, 
	#								tariff_territory: territory) }
	#let(:meter_read_november)	{ FactoryGirl.create(:tariff_meter_read_november,
	#								tariff_territory: territory)}
	let(:billing_class)			{ FactoryGirl.create(:tariff_billing_class, tariff_territory: territory) }
	let(:tariff_energy)			{ FactoryGirl.create(:tariff_tariff_energy, tariff_billing_class: billing_class) }
	let(:tariff_delivery)		{ FactoryGirl.create(:tariff_tariff_delivery, tariff_billing_class: billing_class) }
	let(:bill_group_energy) 	{ FactoryGirl.create(:tariff_bill_group_energy, tariff_billing_class: billing_class) }
	let(:bill_group_delivery) 	{ FactoryGirl.create(:tariff_bill_group_delivery, tariff_billing_class: billing_class) }

	#let(:line_items_fixed)		{ FactoryGirl.create(:tariff_line_item_fixed, tariff_tariff: tariff_delivery, 
	#								tariff_season: season_all, tariff_bill_group: bill_group_delivery) }	

    before { click_link 'Bill Comparison' }
    #before { visit '/input' }
    
    # without a selected site, user should be redirected to '/input'
	describe "Input page" do

		it { should have_selector('div.alert.alert-notice', text: "No Site currently selected.") }

		it { should have_title('Input') }
		it { should have_content('Zip code') }
		it { should have_content('Phases') }
		it { should have_content('All Demand (in kW)') }
		it { should have_content('All Usage (in kWh)') }
		it { should have_content('Meter Read Date (yyyy-mm-dd)') }
		
		it { should_not have_content('View Demo') }
		it { should_not have_content('Contact') }
		it { should_not have_content('Sign In') }

		it { should have_content('Profile') }
		it { should have_content('Site') }
		it { should have_content('Bill Comparison') }
		
		it { should have_link('Sign Out',			href: signout_path) }

		before do
			@test_territory_zip = TariffTerritoryZipCodeRel.create(tariff_territory_id: territory.id,
					tariff_zip_code_id: zip_code.id)
			@test_meter_read1 = TariffMeterRead.create(meter_read_date: "2013-09-27", billing_month: "October", 
					billing_year: "2013" , tariff_territory_id: territory.id)
			@test_meter_read2 = TariffMeterRead.create(meter_read_date: "2013-10-29", billing_month: "November", 
					billing_year: "2013" , tariff_territory_id: territory.id)
			@test_line_item1 = TariffLineItems.create(line_item_name: "BGS-FP (Winter)", line_item_type: "$/kWh", 
					effective_date: "2013-05-29", expiration_date: "", line_item_rate: "0.095672", tou_type: "All",
					bill_group_order: "1", tariff_tariff_id: tariff_energy.id, tariff_season_id: season_winter.id, 
					tariff_bill_group_id: bill_group_energy.id)
			@test_line_item2 = TariffLineItems.create(line_item_name: "Customer Charge", line_item_type: "$/month", 
					effective_date: "2006-07-15", expiration_date: "", line_item_rate: "11.65", tou_type: "All",
					bill_group_order: "1", tariff_tariff_id: tariff_delivery.id, tariff_season_id: season_all.id, 
					tariff_bill_group_id: bill_group_delivery.id)
		end

		describe "after invalid Input submission" do
			
			describe "with zip code not in the database" do

				before do
					fill_in "Zip code",							with: "00001"
	       			select  "3-phase", 							from: "Phases"
    	   			fill_in "All Demand (in kW)",				with: "100"
       				fill_in "All Usage (in kWh)",				with: "10000"
       				fill_in "Meter Read Date (yyyy-mm-dd)",   	with: "2013-10-01"
       				click_button "Submit"
				end

				it { should have_title('Input') }
				it { should_not have_title('Bill Comparison') }
		        it { should have_selector('div.alert.alert-notice', text: 'Zip Code is currently not supported.') }

		        it "emails invalid zip code to support@gulchsolutions.com" do
		        
			        last_email.to.should eq(["support@gulchsolutions.com"])

		        end

			end

			describe "with zip code outside permissions area" do

		        #it "emails new user info to info@gulchsolutions.com" do

		        #  last_email.to.should eq(["info@gulchsolutions.com"])
		        
		        #end

			end

			describe "with other invalid data" do

				before do
					fill_in "Zip code",							with: "00000"
	       			select  "3-phase", 							from: "Phases"
    	   			fill_in "All Usage (in kWh)",				with: "10000"
    	   			fill_in "All Demand (in kW)",				with: "-1"
       				fill_in "Meter Read Date (yyyy-mm-dd)",   	with: "2013-10-01"
       				click_button "Submit"
				end

				it { should have_title('Input') }
				it { should_not have_title('Bill Comparison') }
		        it { should have_selector('div.alert.alert-notice', text: 'Data input has returned an error.') }

				it "emails information resulting in invalid result to support@gulchsolutions.com" do
		        
			        last_email.to.should eq(["support@gulchsolutions.com"])

		        end		        

			end

		end

		describe "after valid Input submission" do

			before do
       			fill_in "Zip code",      					with: "00000"
       			select  "3-phase", 							from: "Phases"
       			fill_in "All Usage (in kWh)",				with: "10000"
       			fill_in "All Demand (in kW)",				with: "100"
       			fill_in "Meter Read Date (yyyy-mm-dd)",  	with: "2013-10-01"
       			click_button "Submit"      			
    		end

			describe  "Tariff Tool page" do

				it { should have_title('Bill Comparison') }
				it { should_not have_content('Input Zip Code') }
				it { should_not have_title('Input') }

				it { should have_content('Billing Period:') }
				it { should have_content('kWh used = 10000') }
				it { should have_content('Billed Load in kW =') }
				it { should have_content('Rate Class:') }
				it { should have_content('Total Bill =') }

			end	

			describe "update usage on-the-fly" do

				describe "with invalid input" do

				end

				describe "with valid input" do

					before { click_link "(edit usage)" }

					it { should have_content('New Usage:') }

					before do
						fill_in "New Usage:",			with: "20000"
						click_button "OK"
					end

					it { should have_content('kWh used = 20000') }

				end
			end
		end
	end
end
