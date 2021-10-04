class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_when_signup.subject
  #
  def welcome_email
   @user = params[:user]
   mail(to: @user.email, subject: 'ようこそ！自炊フレンドへ！')
  end
end
