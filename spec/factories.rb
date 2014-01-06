FactoryGirl.define do 

	factory :user do
		first_name				"Test"
		sequence(:last_name)	{ |n| "Test#{n}" }
		sequence(:email)		{ |n| "test#{n}@example.com" }
		phone       			"555-867-5309"
		company					"Acme Inc"
		address     			"123 Main Street"
		city        			"Any Town"
		state					"IL"
		zip						"00000"
		password				"foobar"
		password_confirmation	{ |u| u.password }
	end

	factory :site do
		sequence(:site_name)	{ |n| "Test Site #{n}" }
		company 				"Acme Inc."
		industry_type 			"Commercial"
		building_type 			"Office"
		description 			"Standard office building"
		address 				"123 Main St"
		city 					"Any Town"
		state 					"NJ"
		zip_code 				"00000"
		square_feet 			"3000"
		phases 					"3-phase"
		is_site_saved 			"true"
		user
	end

	factory :site_load_profile do
		meter_read_date		"2013-10-01"
		data_source			"Monthly"
		#tou				"All"
		all_demand			"100"
		all_usage			"10000"
		site
	end

	factory :tariff_utility do
		utility_name	"JCP&L"
		state			"NJ"
	end

	factory :tariff_territory do
		territory_name	"JCP&L"
		tariff_utility
	end

	factory :tariff_zip_code do
		zip_code 		"00000"
	end

	factory :tariff_territory_zip_code_rel do
		association :tariff_territory, :tariff_zip_code
	end

	factory :tariff_season_all, class: "TariffSeason" do
		season_type			"All"
		season_start_date	"2010-01-01"
		season_end_date		"2059-12-31"
		tariff_territory
	end

	factory :tariff_season_winter, class: "TariffSeason" do
		season_type			"Winter"
		season_start_date	"2013-09-27"
		season_end_date		"2014-01-27"
		tariff_territory
	end

	factory :tariff_meter_read_october, class: "TariffMeterRead" do
		meter_read_date 	"2013-09-27"
		billing_month 		"October"
		billing_year		"2013"
		tariff_territory
	end

	factory :tariff_meter_read_november, class: "TariffMeterRead" do
		meter_read_date 	"2013-10-29"
		billing_month 		"November"
		billing_year		"2013"
		tariff_territory
	end

	factory :tariff_billing_class do
		billing_class_name	"GS Secondary Medium Three Phase"
		customer_type		"Commercial"
		phases				"3-phase"
		voltage				"Secondary"
		units				"kW"
		start_value			"10"
		end_value			"500"
		tariff_territory
	end

	factory :tariff_tariff_energy, class: "TariffTariff" do
		tariff_name			"JCP&L Commercial Service (Energy)"
		tariff_type 		"Energy"
		tariff_billing_class
	end

	factory :tariff_tariff_delivery, class: "TariffTariff" do
		tariff_name			"JCP&L Commercial Service (Delivery)"
		tariff_type 		"Delivery"
		tariff_billing_class
	end

	factory :tariff_bill_group_energy, class: "TariffBillGroup" do
		bill_group_name		"Billing Information For Supplier"
		bill_group_order	"2"
		tariff_billing_class
	end

	factory :tariff_bill_group_delivery, class: "TariffBillGroup" do
		bill_group_name		"Charges from JCP&L"
		bill_group_order	"1"
		tariff_billing_class
	end

	factory :tariff_line_item_fixed, class: "TariffLineItems" do
		line_item_name		"Customer Charge"
		line_item_type		"$/month"
		effective_date		"2006-07-15"
		expiration_date		""
		line_item_rate		"11.65"
		tou_type			"All"
		bill_group_order	"1"
		association :tariff_tariff, :tariff_season, :tariff_bill_group

	end

	factory :tariff_line_item_kWh, class: "TariffLineItems" do
		line_item_name		"BGS-FP (Winter)"
		line_item_type		"$/kWh"
		effective_date		"2013-05-29"
		expiration_date		""
		line_item_rate		"0.095672"
		tou_type			"All"
		bill_group_order	"1"
		association :tariff_tariff, :tariff_season, :tariff_bill_group

	end


end