require 'spec_helper'

describe TariffTou do

  	before { @tariff_tou = TariffTou.new(tou_type: "Peak", day_of_week: "Week", 
  							start_time: "15:00:00", end_time: "20:00:00", 
  							tariff_seasons_id: "1") }

  	subject { @tariff_tou }

  	it { should respond_to(:tou_type) }
  	it { should respond_to(:day_of_week) }
  	it { should respond_to(:start_time) }
  	it { should respond_to(:end_time) }
  	it { should respond_to(:tariff_seasons_id) }

    it { should be_valid }
  	
# tou_type
  	describe "when tou_type is not present" do
  		before { @tariff_tou.tou_type = " " }
  		it { should_not be_valid }
  	end

  	# -> validate it's one of the choices (Peak, Part-Peak, Off-Peak)


# day_of_week
  	describe "when day_of_week is not present" do
  		before { @tariff_tou.day_of_week = " " }
  		it { should_not be_valid }
  	end

  	# -> validate it's one of the choices (Week, Sat, Sun, Hol)



# start_time
  	describe "when start_time is not present" do
  		before { @tariff_tou.start_time = " " }
  		it { should_not be_valid }
  	end

  	# -> validate it's in the correct time format



# end_time
  	describe "when end_time is not present" do
  		before { @tariff_tou.end_time = " " }
  		it { should_not be_valid }
  	end

	# -> validate it's in the correct time format



# tariff_seasons_id
  	describe "when tariff_seasons_id is not present" do
  		before { @tariff_tou.tariff_seasons_id = " " }
  		it { should_not be_valid }
  	end


end
