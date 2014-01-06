require 'spec_helper'

describe TariffSettlementLoadProfile do

  	before { @tariff_settlement_load_profile = TariffSettlementLoadProfile.new(
  							slp_date: "2013-09-23", slp_time: "12:30:00", 
  							slp_factor: 1.75, tariff_load_class_id: 1) }
  							
  	subject { @tariff_settlement_load_profile }

  	it { should respond_to(:slp_date) }
  	it { should respond_to(:slp_time) }
  	it { should respond_to(:slp_factor) }
  	it { should respond_to(:tariff_load_class_id) }

    it { should be_valid }
  	
# slp_date
  	describe "when slp_date is not present" do
  		before { @tariff_settlement_load_profile.slp_date = " " }
  		it { should_not be_valid }
  	end

# slp_time
  	describe "when slp_time is not present" do
  		before { @tariff_settlement_load_profile.slp_time = " " }
  		it { should_not be_valid }
  	end

# slp_factor
  	describe "when slp_factor is not present" do
  		before { @tariff_settlement_load_profile.slp_factor = " " }
  		it { should_not be_valid }
  	end

  	describe "when slp_factor is not a number" do
  		before { @tariff_settlement_load_profile.slp_factor = "a" }
  		it { should_not be_valid }
  	end

# tariff_load_class_id
  	describe "when tariff_load_class_id is not present" do
  		before { @tariff_settlement_load_profile.tariff_load_class_id = " " }
  		it { should_not be_valid }
  	end


end