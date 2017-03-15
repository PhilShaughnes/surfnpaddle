class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: @user.email, subject: "welcome!")
  end

  def password_reset(username)
    @user = User.find_by(name: username)
    mail(to: @user.email, subject: "password reset")
  end
end
