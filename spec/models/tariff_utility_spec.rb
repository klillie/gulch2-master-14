require 'spec_helper'


describe TariffUtility do

	before { @tariff_utility = TariffUtility.new(utility_name: "Example Utility", 
								state: "IL") }
	
	subject { @tariff_utility }

  	it { should respond_to(:utility_name) }
  	it { should respond_to(:state) }

    it { should be_valid }

# utility_name
  	describe "when utility_name is not present" do
  		before { @tariff_utility.utility_name = " " }
  		it { should_not be_valid }
  	end

# state
  	describe "when state is not present" do
  		before { @tariff_utility.state = " " }
  		it { should_not be_valid }
  	end

	describe "when state is too long" do
		before { @tariff_utility.state = "a" * 3 }
		it { should_not be_valid }
  	end

	describe "when state is too short" do
		before { @tariff_utility.state = "a" }
		it { should_not be_valid }
  	end

  	# -> validate it's a proper state identifier



end
