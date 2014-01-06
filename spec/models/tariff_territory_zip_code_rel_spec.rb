require 'spec_helper'

describe TariffTerritoryZipCodeRel do

  	before { @tariff_territory_zip_code_rel = TariffTerritoryZipCodeRel.new(
  							tariff_territory_id: 1, tariff_zip_code_id: 1) }
  		
  	subject { @tariff_territory_zip_code_rel }

  	it { should respond_to(:tariff_territory_id) }
  	it { should respond_to(:tariff_zip_code_id) }

    it { should be_valid }
  	
# tariff_territory_id
  	describe "when tariff_territory_id is not present" do
  		before { @tariff_territory_zip_code_rel.tariff_territory_id = " " }
  		it { should_not be_valid }
  	end

# tariff_zip_code_id
  	describe "when tariff_zip_code_id is not present" do
  		before { @tariff_territory_zip_code_rel.tariff_zip_code_id = " " }
  		it { should_not be_valid }
  	end

end
