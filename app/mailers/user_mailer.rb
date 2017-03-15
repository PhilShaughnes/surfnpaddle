class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: 'philipshaughnessy+tiytest@gmail.com', subject: "welcome!")
  end

  def password_reset(username)
    @user = User.find_by(name: username)
    mail(to: 'philipshaughnessy+tiytest@gmail.com', subject: "password reset")
  end
end
