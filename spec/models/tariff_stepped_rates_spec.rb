require 'spec_helper'

describe TariffSteppedRates do

  	before { @stepped_rates = TariffSteppedRates.new(stepped_rates_unit: "kWh",
  							stepped_rates_start: 0, stepped_rates_end: 1000,
  							stepped_rates_rate: 1.75, 
  							stepped_rates_city: "Example Town",
  							tariff_line_item_id: 1) }

  	subject { @stepped_rates }

  	it { should respond_to(:stepped_rates_unit) }
  	it { should respond_to(:stepped_rates_start) }
  	it { should respond_to(:stepped_rates_end) }
  	it { should respond_to(:stepped_rates_rate) }
  	it { should respond_to(:stepped_rates_city) }
  	it { should respond_to(:tariff_line_item_id) }

    it { should be_valid }
  	
# stepped_rates_unit
  	describe "when stepped_rates_unit is not present" do
  		before { @stepped_rates.stepped_rates_unit = " " }
  		it { should_not be_valid }
  	end

# stepped_rates_start
  	describe "when stepped_rates_start is not present" do
  		before { @stepped_rates.stepped_rates_start = " " }
  		it { should_not be_valid }
  	end

	describe "when stepped_rates_start is not a number" do
  		before { @stepped_rates.stepped_rates_start = "a" }
  		it { should_not be_valid }
  	end  	

# stepped_rates_end
  	describe "when stepped_rates_unit is not present" do
  		before { @stepped_rates.stepped_rates_end = " " }
  		it { should be_valid }
  	end

  	# -> validate that it is a number if it is present



# stepped_rates_city
  	describe "when stepped_rates_city is not present" do
  		before { @stepped_rates.stepped_rates_city = " " }
  		it { should be_valid }
  	end

# tariff_line_item
  	describe "when tariff_line_item_id is not present" do
  		before { @stepped_rates.tariff_line_item_id = " " }
  		it { should_not be_valid }
  	end


end
