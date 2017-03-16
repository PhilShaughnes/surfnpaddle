class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: @user.email, subject: "welcome!")
  end

  def password_reset(username)
    @user = User.find_by(name: username)
    mail(to: @user.email, subject: "password reset")
  end

  def share(post, email)
    @post = post
    mail(to: email, subject: "check this out: '#{@post.title}'")
  end
end
