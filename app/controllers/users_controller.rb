class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome! #{@user.name}"
    else
      flash.now[:alert] = "Something went wrong..."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
