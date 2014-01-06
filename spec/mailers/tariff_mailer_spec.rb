require "spec_helper"

describe TariffMailer do
  describe "zip missing from database" do
    let(:site) { FactoryGirl.create(:site) }
    let(:mail) { TariffMailer.zip_db_missing(site) }

    it "sends email with missing zip to support@gulchsolutions.com" do
      mail.subject.should eq("Notice: Zip Code Missing from Database")
      mail.to.should eq(["support@gulchsolutions.com"])
      mail.body.should match(site.zip_code)
      #include contact info from submitted user
    end

  end

  describe "user doesn't have permission for that zip code" do

  end

  describe "user data input resulting in invalid result from database" do
    let(:site) { FactoryGirl.create(:site) }
    let(:site_load_profile) { FactoryGirl.create(:site_load_profile) }
    let(:mail) { TariffMailer.database_error(site, site_load_profile) }

    it "sends email with missing zip to support@gulchsolutions.com" do
      mail.subject.should eq("Error: Tariff Tool Input has Resulted in Database Error")
      mail.to.should eq(["support@gulchsolutions.com"])
      mail.body.should match(site.zip_code)
      mail.body.should match(site_load_profile.demand.to_s)
      mail.body.should match(site_load_profile.usage.to_s)
      mail.body.should match(site_load_profile.meter_read_date.to_s)
      #include contact info from submitted user
    end

  end

end
