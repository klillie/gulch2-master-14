require 'spec_helper'

describe TariffBillingClass do

  	before { @tariff_billing_class = TariffBillingClass.new(billing_class_name: "Example Billing Class",
  							customer_type: "Commercial", phases: "3-phase", voltage: "Secondary", 
  							units: "kW", start_value: 0, end_value: 100, tariff_territory_id: 1) }

  	subject { @tariff_billing_class }

  	it { should respond_to(:billing_class_name) }
  	it { should respond_to(:customer_type) }
  	it { should respond_to(:phases) }
  	it { should respond_to(:voltage) }
  	it { should respond_to(:units) }
  	it { should respond_to(:start_value) }
  	it { should respond_to(:end_value) }
  	it { should respond_to(:tariff_territory_id) }

    it { should be_valid }
  	
# billing_class_name
  	describe "when billing_class_name is not present" do
  		before { @tariff_billing_class.billing_class_name = " " }
  		it { should_not be_valid }
  	end

# customer_type 
  	describe "when customer_type is not present" do
  		before { @tariff_billing_class.customer_type = " " }
  		it { should_not be_valid }
  	end

  	# -> validate for "Commercial", "Industrial" or "Residential"

# phases 
  	describe "when phases is not present" do
  		before { @tariff_billing_class.phases = " " }
  		it { should_not be_valid }
  	end

  	# -> validate for "1-phase" or "3-phase"



# voltage 
  	describe "when voltage is not present" do
  		before { @tariff_billing_class.voltage = " " }
  		it { should_not be_valid }
  	end

  	# -> validate for "Secondary" or "Primary"



# units 
  	describe "when units is not present" do
  		before { @tariff_billing_class.units = " " }
  		it { should_not be_valid }
  	end

  	# -> validate for "kW" or "kWh"



# start_value
	describe "when start_value is not numeric" do
		before { @tariff_billing_class.start_value = "a" }
		it { should_not be_valid }
	end

# end_value
	#describe "when end_value is not numeric" do
	#	before { @tariff_billing_class.end_value = "a" }
	#	it { should_not be_valid }
	#end			
	
	#describe "when end_value is blank" do
	#	before { @tariff_billing_class.end_value = " " }
	#	it { should be_valid }
	#end

# start_value vs end_value -> when start value is > end_value



# tariff_territory_id
  	describe "when tariff_territory_id is not present" do
  		before { @tariff_billing_class.tariff_territory_id = " " }
  		it { should_not be_valid }
  	end

end