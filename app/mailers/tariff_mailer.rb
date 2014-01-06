class TariffMailer < ActionMailer::Base
  default from: "support@gulchsolutions.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tariff_mailer.zip_db_missing.subject
  #
  
  def zip_db_missing(site)
    @site = site
    mail to: "support@gulchsolutions.com", subject: "Notice: Zip Code Missing from Database"
  end

  def database_error(site, site_load_profile)
    @site = site
    @site_load_profile = site_load_profile
    mail to: "support@gulchsolutions.com", subject: "Error: Tariff Tool Input has Resulted in Database Error"
  end
end
