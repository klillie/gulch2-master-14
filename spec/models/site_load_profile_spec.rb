require 'spec_helper'

describe SiteLoadProfile do
	
	
	before { @site_load_profile = SiteLoadProfile.new(meter_read_date: "2013-09-23", data_source: "Monthly",
														all_usage: "10000", all_demand: "100", 
														off_peak_usage: "2000", off_peak_demand: "20", 
														site_id: "1") }

	subject { @site_load_profile }

	it { should respond_to(:meter_read_date) }
	it { should respond_to(:data_source) }
	it { should respond_to(:all_usage) }
	it { should respond_to(:all_demand) }
	it { should respond_to(:on_peak_usage) }
	it { should respond_to(:on_peak_demand) }
	it { should respond_to(:part_peak_usage) }
	it { should respond_to(:part_peak_demand) }
	it { should respond_to(:off_peak_usage) }
	it { should respond_to(:off_peak_demand) }
	
	it { should respond_to(:site_id) }

	it { should be_valid }

# meter_read_date
	describe "when meter_read_date is not present" do
		before { @site_load_profile.meter_read_date = " " }
		it { should_not be_valid }
	end

	describe "when meter_read_date is invalid" do
		before { @site_load_profile.meter_read_date = "9999-99-99"}
		it { should_not be_valid }
	end

# data_source
	describe "when data_source is not present" do
		before { @site_load_profile.data_source = " " }
		it { should_not be_valid }
	end

# all_usage
	describe "when all_usage is not present" do
		before { @site_load_profile.all_usage = " " }
		it { should_not be_valid }
	end

# all_demand
	describe "when all_demand is not present" do
		before { @site_load_profile.all_demand = " " }
		it { should_not be_valid }
	end

# off_peak_usage
	describe "when off_peak_usage is not present" do
		before { @site_load_profile.off_peak_usage = " " }
		it { should be_valid }
	end

# off_peak_demand
	describe "when off_peak_demand is not present" do
		before { @site_load_profile.off_peak_demand = " " }
		it { should be_valid }
	end

# site_id
	describe "when site_id is not present" do
		before { @site_load_profile.site_id = nil }
		it { should_not be_valid }
	end

end
