class UserMailer < ActionMailer::Base
  default from: 'support@gulchsolutions.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :bcc => 'support@gulchsolutions.com', :subject => "Password Reset"
  end

  def new_user_info(user)
    @user = user
    mail :to => 'info@gulchsolutions.com', :subject => "New User Sign Up"
  end

  def new_user_welcome(user)
    @user = user
    mail :to => user.email, :subject => "Welcome to Gulch Solutions"
  end

end
