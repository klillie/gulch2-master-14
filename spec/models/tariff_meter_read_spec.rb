require 'spec_helper'

describe TariffMeterRead do

  	before { @tariff_meter_read = TariffMeterRead.new(meter_read_date: "2013-09-23",
  							billing_month: "September", billing_year: "2013", 
  							tariff_territory_id: 1) }

  	subject { @tariff_meter_read }

  	it { should respond_to(:meter_read_date) }
  	it { should respond_to(:billing_month) }
  	it { should respond_to(:billing_year) }
  	it { should respond_to(:tariff_territory_id) }

    it { should be_valid }
  	
# meter_read_date
  	describe "when meter_read_date is not present" do
  		before { @tariff_meter_read.meter_read_date = " " }
  		it { should_not be_valid }
  	end

# billing_month
  	describe "when billing_month is not present" do
  		before { @tariff_meter_read.billing_month = " " }
  		it { should_not be_valid }
  	end

  	# -> validate that billing_month is the name of one of the 12 months

# billing_year
  	describe "when billing_year is not present" do
  		before { @tariff_meter_read.billing_year = " " }
  		it { should_not be_valid }
  	end

  	describe "when billing_year is not numeric" do
  		before { @tariff_meter_read.billing_year = "a" }
  		it { should_not be_valid }
  	end

	describe "when billing_year is too short" do
  		before { @tariff_meter_read.billing_year = "1"*3 }
  		it { should_not be_valid }
  	end

  	describe "when billing_year is too long" do
  		before { @tariff_meter_read.billing_year = "1"*5 }
  		it { should_not be_valid }
  	end

# tariff_territory_id
  	describe "when tariff_territory_id is not present" do
  		before { @tariff_meter_read.tariff_territory_id = " " }
  		it { should_not be_valid }
  	end


end