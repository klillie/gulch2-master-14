require 'spec_helper'

describe TariffTerritory do

  	before { @tariff_territory = TariffTerritory.new(territory_name: "Example Territory",
  							tariff_utility_id: 1) }

  	subject { @tariff_territory }

  	it { should respond_to(:territory_name) }
  	it { should respond_to(:tariff_utility_id) }

    it { should be_valid }
  	
# territory_name
  	describe "when territory_name is not present" do
  		before { @tariff_territory.territory_name = " " }
  		it { should_not be_valid }
  	end

# tariff_utility_id
  	describe "when tariff_utility_id is not present" do
  		before { @tariff_territory.tariff_utility_id = " " }
  		it { should_not be_valid }
  	end

end
