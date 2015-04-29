class UserMailer < ApplicationMailer

  def signup_welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Rotten Mangoes!")
  end

  def deleted_by_admin_email(user)
    @user = user
    mail(to: @user.email, subject: "Account Termination")
  end

end
