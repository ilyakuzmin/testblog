class UserMailer < ActionMailer::Base
  default :from => "uniqblog.heroku.com"

  def welcome_email(user)
    @user = user
    @url = "http://uniqblog.heroku.com"
    mail(:to => user.email, :subject => "Welcome to Uniqblog!")
  end
end
