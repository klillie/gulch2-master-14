require 'spec_helper'

describe TariffZipCode do

  	before { @tariff_zip_code = TariffZipCode.new(zip_code: "60661") }

  	subject { @tariff_zip_code }

  	it { should respond_to(:zip_code) }

    it { should be_valid }

# zip_code
  	describe "when zip_code is not present" do
  		before { @tariff_zip_code.zip_code = " " }
  		it { should_not be_valid }
  	end

  	describe "when zip_code is not numeric" do
  		before { @tariff_zip_code.zip_code = "a" * 5 }
  		it { should_not be_valid }
  	end

  	describe "when zip_code is too short" do
  		before { @tariff_zip_code.zip_code = "1" * 4 }
  		it { should_not be_valid }
  	end

  	describe "when zip_code is too long" do
  		before { @tariff_zip_code.zip_code = "1" * 6 }
  		it { should_not be_valid }
  	end

end
