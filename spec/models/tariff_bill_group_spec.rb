require 'spec_helper'

describe TariffBillGroup do

  	before { @tariff_bill_group = TariffBillGroup.new(bill_group_name: "Example Bill Group",
  							bill_group_order: "1", tariff_billing_class_id: "1") }

  	subject { @tariff_bill_group }

  	it { should respond_to(:bill_group_name) }
  	it { should respond_to(:bill_group_order) }
  	it { should respond_to(:tariff_billing_class_id) }

  	it { should be_valid }
  	
# bill_group_name
  	describe "when bill_group_name is not present" do
  		before { @tariff_bill_group.bill_group_name = " " }
  		it { should_not be_valid }
  	end

# bill_group_order
	describe "when bill_group_id is not present" do
		before { @tariff_bill_group.bill_group_order = " " }
		it { should_not be_valid }
	end

	describe "when bill_group_order is not a number" do
		before { @tariff_bill_group.bill_group_order = "a" }
		it { should_not be_valid }
	end

# tariff_billing_class_id 
	describe "when billing_class_id is not present" do
		before { @tariff_bill_group.tariff_billing_class_id = " " }
		it { should_not be_valid }
	end

end
