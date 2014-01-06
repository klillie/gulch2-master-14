require 'spec_helper'

describe TariffLmpRate do

  	before { @tariff_lmp_rate = TariffLmpRate.new(lmp_date: "2013-09-23", 
  							lmp_time: "12:00:00", lmp_factor: 1.5, 
  							tariff_iso_lmp_id: 1) }

  	subject { @tariff_lmp_rate }

  	it { should respond_to(:lmp_date) }
  	it { should respond_to(:lmp_time) }
  	it { should respond_to(:lmp_factor) }
  	
    it { should be_valid }
    
# lmp_date
  	describe "when lmp_date is not present" do
  		before { @tariff_lmp_rate.lmp_date = " " }
  		it { should_not be_valid }
  	end

  	# -> lmp_date is in proper date format

# lmp_time
  	describe "when lmp_time is not present" do
  		before { @tariff_lmp_rate.lmp_time = " " }
  		it { should_not be_valid }
  	end

  	# -> lmp_time is in proper time format

# lmp_factor
  	describe "when lmp_factor is not present" do
  		before { @tariff_lmp_rate.lmp_date = " " }
  		it { should_not be_valid }
  	end

	describe "when lmp_factor is not a number" do
  		before { @tariff_lmp_rate.lmp_factor = "a" }
  		it { should_not be_valid }
  	end

# tariff_iso_lmp_id
  	describe "when lmp_factor is not present" do
  		before { @tariff_lmp_rate.tariff_iso_lmp_id = " " }
  		it { should_not be_valid }
  	end


end