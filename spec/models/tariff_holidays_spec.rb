require 'spec_helper'

describe TariffHolidays do

  	before { @holiday = TariffHolidays.new(holiday_name: "Example Holiday", holiday_date: "2013-07-04",
  							tariff_territory_id: 1) }

  	subject { @holiday }

  	it { should respond_to(:holiday_name) }
  	it { should respond_to(:holiday_date) }
  	it { should respond_to(:tariff_territory_id) }

    it { should be_valid }
  	
# holiday_name
  	describe "when holiday_name is not present" do
  		before { @holiday.holiday_name = " " }
  		it { should_not be_valid }
  	end

# holiday_date
	describe "when holiday_date is not present" do
  		before { @holiday.holiday_date = " " }
  		it { should_not be_valid }
  	end

  	# -> validates that holiday_date is in date format
	#describe "when holiday_date is not in date format" do
  	#	before { @holiday.holiday_name = " " }
  	#	it { should_not be_valid }
  	#end

# tariff_territory_id
	describe "when tariff_territory_id is not present" do
  		before { @holiday.tariff_territory_id = " " }
  		it { should_not be_valid }
  	end

end
