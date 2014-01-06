require 'spec_helper'

describe TariffIsoLmp do

  	before { @tariff_iso_lmp = TariffIsoLmp.new(iso_rto: "Example ISO/RTO",
  							hub: "Example Hub", da_rt: "Day Ahead") }

  	subject { @tariff_iso_lmp }

  	it { should respond_to(:iso_rto) }
  	it { should respond_to(:hub) }
  	it { should respond_to(:da_rt) }

    it { should be_valid }
  	
# iso_rto
  	describe "when iso_rto is not present" do
  		before { @tariff_iso_lmp.iso_rto = " " }
  		it { should_not be_valid }
  	end

# hub
  	describe "when hub is not present" do
  		before { @tariff_iso_lmp.hub = " " }
  		it { should_not be_valid }
  	end

# da_rt
  	describe "when da_rt is not present" do
  		before { @tariff_iso_lmp.da_rt = " " }
  		it { should_not be_valid }
  	end

end