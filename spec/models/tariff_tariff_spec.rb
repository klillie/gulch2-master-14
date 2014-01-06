require 'spec_helper'

describe TariffTariff do

  	before { @tariff_tariff = TariffTariff.new(tariff_name: "Example Name",
  							tariff_type: "Delivery", tariff_billing_class_id: 1) }

  	subject { @tariff_tariff }

  	it { should respond_to(:tariff_name) }
  	it { should respond_to(:tariff_type) }
  	it { should respond_to(:tariff_billing_class_id) }

    it { should be_valid }
  	
# tariff_name
  	describe "when tariff_name is not present" do
  		before { @tariff_tariff.tariff_name = " " }
  		it { should_not be_valid }
  	end

# tariff_type
  	describe "when tariff_type is not present" do
  		before { @tariff_tariff.tariff_type = " " }
  		it { should_not be_valid }
  	end

  	# -> validate that it states "Energy", "Delivery", or "Bundled"



# tariff_billing_class_id
  	describe "when tariff_billing_class_id is not present" do
  		before { @tariff_tariff.tariff_billing_class_id = " " }
  		it { should_not be_valid }
  	end


end
