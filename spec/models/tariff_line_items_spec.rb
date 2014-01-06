require 'spec_helper'

describe TariffLineItems do

  	before { @tariff_line_items = TariffLineItems.new(line_item_name: "Example Line Item", 
  							line_item_type: "$/kWh", effective_date: "2013-05-29", 
  							expiration_date: "2014-05-29", line_item_rate: "0.097319", 
  							tou_type: "All", bill_group_order: "1", tariff_tariff_id: "1",
  							tariff_season_id: "5", tariff_bill_group_id: "1") }

  	subject { @tariff_line_items }

  	it { should respond_to(:line_item_name) }
  	it { should respond_to(:line_item_type) }
  	it { should respond_to(:effective_date) }
  	it { should respond_to(:expiration_date) }
  	it { should respond_to(:line_item_rate) }
  	it { should respond_to(:tou_type) }
  	it { should respond_to(:bill_group_order) }
  	it { should respond_to(:tariff_tariff_id) }
  	it { should respond_to(:tariff_season_id) }
  	it { should respond_to(:tariff_bill_group_id) }

    it { should be_valid }
  	
# line_item_name
  	describe "when line_item_name is not present" do
  		before { @tariff_line_items.line_item_name = " " }
  		it { should_not be_valid }
  	end

# line_item_type
  	describe "when line_item_type is not present" do
  		before { @tariff_line_items.line_item_type = " " }
  		it { should_not be_valid }
  	end

  	# -> need to validate that the line_item_type is one of the line_item_types
  			# $/kWh, $/kW, $/month, etc.

# effective_date
  	describe "when line_item_name is not present" do
  		before { @tariff_line_items.effective_date = " " }
  		it { should_not be_valid }
  	end

  	# -> need to validate that it is in a correct date format

# expiration_date
	# -> need to validate that it is in a correct date format if it's present

# line_item_rate
  	#describe "when line_item_rate is not a number" do
  	#	before { @tariff_line_items.line_item_rate = "a" }
  	#	it { should_not be_valid }
  	#end

  	#describe "when line_item_rate is not present" do
    #	before { @tariff_line_items.line_item_rate = " " }
    #	it { should_not be_valid }
    #end

  #describe "when line_item type is Stepped" do
  #	before { @tariff_line_item.line_item_type = "Stepped" }
	
	#	describe "when line_item_rate is not present" do
	#  		before { @tariff_line_item.line_item_rate = " " }
	#  		it { should be_valid }
	#  	end
	#end

  #describe "when line_item type is Indexed" do
  #	before { @tariff_line_item.line_item_type = "Indexed Rate" }
	
	#	describe "when line_item_rate is not present" do
	#  		before { @tariff_line_item.line_item_rate = " " }
	#  		it { should be_valid }
	#  	end
	#end

# tou_type
  	describe "when tou_type is not present" do
  		before { @tariff_line_items.tou_type = " " }
  		it { should_not be_valid }
  	end

  	# -> need to check that tou_type is one of the valid tou_types
  		# "All", "Peak", "Part-Peak", "Off-Peak"

# bill_group_order
  	describe "when bill_group_order is not present" do
  		before { @tariff_line_items.bill_group_order = " " }
  		it { should_not be_valid }
  	end

# tariff_tariff_id
  	describe "when tariff_tariff_id is not present" do
  		before { @tariff_line_items.tariff_tariff_id = " " }
  		it { should_not be_valid }
  	end

# tariff_season_id
  	describe "when tariff_season_id is not present" do
  		before { @tariff_line_items.tariff_season_id = " " }
  		it { should_not be_valid }
  	end

# tariff_bill_group_id
  	describe "when tariff_bill_group_id is not present" do
  		before { @tariff_line_items.tariff_bill_group_id = " " }
  		it { should_not be_valid }
  	end

end
