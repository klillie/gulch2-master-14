require 'spec_helper'

describe TariffIndexedRate do

  	before { @tariff_indexed_rate = TariffIndexedRate.new(additional_charge: 1.00, 
  							tariff_line_item_id: 1, tariff_iso_lmp_id: 1) }

  	subject { @tariff_indexed_rate }

  	it { should respond_to(:additional_charge) }
  	it { should respond_to(:tariff_line_item_id) }
  	it { should respond_to(:tariff_iso_lmp_id) }
  	
    it { should be_valid }
    
# additional_charge
  	describe "when additional_charge is not numeric" do
  		before { @tariff_indexed_rate.additional_charge = "a" }
  		it { should_not be_valid }
  	end

# tariff_line_item_id
  	describe "when tariff_line_item_id is not present" do
  		before { @tariff_indexed_rate.tariff_line_item_id = " " }
  		it { should_not be_valid }
  	end

# tariff_iso_lmp_id
  	describe "when tariff_iso_lmp_id is not present" do
  		before { @tariff_indexed_rate.tariff_iso_lmp_id = " " }
  		it { should_not be_valid }
  	end

end
