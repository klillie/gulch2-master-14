require 'spec_helper'

describe TariffLoadClass do

  	before { @tariff_load_class = TariffLoadClass.new(load_class_name: "Example Load Class",
  							customer_type: "?", voltage: "Secondary", load_class_units: "kW",
  							load_class_start: 0, load_class_end: 100, weather_zone: "Example Weather Zone",
  							tariff_territory_id: 1) }

  	subject { @tariff_load_class }

  	it { should respond_to(:load_class_name) }
  	it { should respond_to(:customer_type) }
  	it { should respond_to(:voltage) }
  	it { should respond_to(:load_class_units) }
  	it { should respond_to(:load_class_start) }
  	it { should respond_to(:load_class_end) }
  	it { should respond_to(:weather_zone) }
  	it { should respond_to(:tariff_territory_id) }

    it { should be_valid }
  	
# load_class_name
  	describe "when load_class_name is not present" do
  		before { @tariff_load_class.load_class_name = " " }
  		it { should_not be_valid }
  	end

# customer_type
  	describe "when customer_type is not present" do
  		before { @tariff_load_class.customer_type = " " }
  		it { should_not be_valid }
  	end

  	# -> verify that customer_type is one of the types of customers
  		# ie: commercial, industrial, residential

# voltage
  	describe "when voltage is not present" do
  		before { @tariff_load_class.voltage = " " }
  		it { should_not be_valid }
  	end

  	# -> verify that voltage is one of the types of voltage
  		# ie: Secondary, Primary

# load_class_units
  	describe "when load_class_units is not present" do
  		before { @tariff_load_class.load_class_units = " " }
  		it { should_not be_valid }
  	end

  	# -> verify that load_class_units is one of the load_class_units
  		# ie: kW, kWh

# load_class_start
  	describe "when load_class_start is not present" do
  		before { @tariff_load_class.load_class_start = " " }
  		it { should_not be_valid }
  	end

	describe "when load_class_start is not numeric" do
  		before { @tariff_load_class.load_class_start = "a" }
  		it { should_not be_valid }
  	end

# load_class_end
	# -> if present, load_class_end needs to be a number



# tariff_territory_id
  	describe "when tariff_territory_id is not present" do
  		before { @tariff_load_class.tariff_territory_id = " " }
  		it { should_not be_valid }
  	end

end
