require 'spec_helper'

describe TariffMuniFranchiseCost do

  	before { @tariff_muni_franchise_cost = TariffMuniFranchiseCost.new(
  							fca_city: "Example City", fca_rate: 1.75, 
  							tariff_line_item_id: 1) }
  		
  	subject { @tariff_muni_franchise_cost }

  	it { should respond_to(:fca_city) }
  	it { should respond_to(:fca_rate) }
  	it { should respond_to(:tariff_line_item_id) }

    it { should be_valid }
  	
# fca_city
  	describe "when fca_city is not present" do
  		before { @tariff_muni_franchise_cost.fca_city = " " }
  		it { should_not be_valid }
  	end

# fca_rate
  	describe "when fca_rate is not present" do
  		before { @tariff_muni_franchise_cost.fca_rate = " " }
  		it { should_not be_valid }
  	end

	describe "when fca_rate is not a number" do
  		before { @tariff_muni_franchise_cost.fca_rate = "a" }
  		it { should_not be_valid }
  	end

# tariff_line_item_id
  	describe "when tariff_line_item_id is not present" do
  		before { @tariff_muni_franchise_cost.tariff_line_item_id = " " }
  		it { should_not be_valid }
  	end


end