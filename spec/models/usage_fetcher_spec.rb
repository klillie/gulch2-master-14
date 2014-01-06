require 'spec_helper'

describe UsageFetcher do
	before { @usage_fetcher = UsageFetcher.new(account_no: "1", zip_code: "60661") }
 	
  	subject { @usage_fetcher }

  	it { should respond_to(:account_no) }
  	it { should respond_to(:zip_code) }

  	it { should be_valid }

# account_no
	describe "when account_no is not present" do
		before { @usage_fetcher.account_no = " " }
		it { should_not be_valid }
	end

	# => additional validations of proper account_no formatting should occur once utility has been determined

# zip_code
  	describe "when zip_code is not present" do
  		before { @usage_fetcher.zip_code = " " }
  		it { should_not be_valid }
  	end

  	describe "when zip_code is not numeric" do
  		before { @usage_fetcher.zip_code = "a" * 5 }
  		it { should_not be_valid }
  	end

  	describe "when zip_code is too short" do
  		before { @usage_fetcher.zip_code = "1" * 4 }
  		it { should_not be_valid }
  	end

  	describe "when zip_code is too long" do
  		before { @usage_fetcher.zip_code = "1" * 6 }
  		it { should_not be_valid }
  	end

end
