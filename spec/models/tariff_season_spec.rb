require 'spec_helper'

describe TariffSeason do

  	before { @tariff_season = TariffSeason.new(season_type: "Summer",
  							season_start_date: "2013-06-01",
  							season_end_date: "2013-09-30", tariff_territory_id: 1) } 
  							
  	subject { @tariff_season }

  	it { should respond_to(:season_type) }
  	it { should respond_to(:season_start_date) }
  	it { should respond_to(:season_end_date) }
  	it { should respond_to(:tariff_territory_id) }

    it { should be_valid }
  	
# season_type
  	describe "when season_type is not present" do
  		before { @tariff_season.season_type = " " }
  		it { should_not be_valid }
  	end

# season_start_date
  	describe "when season_start_date is not present" do
  		before { @tariff_season.season_start_date = " " }
  		it { should_not be_valid }
  	end

  	# -> needs to validate that it's a proper date format



# season_end_date
  	describe "when season_end_date is not present" do
  		before { @tariff_season.season_end_date = " " }
  		it { should_not be_valid }
  	end

# -> needs to validate that it's a proper date format

  	

# tariff_territory_id
  	describe "when tariff_territory_id is not present" do
  		before { @tariff_season.tariff_territory_id = " " }
  		it { should_not be_valid }
  	end


end
