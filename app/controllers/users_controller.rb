class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :delete, :destroy]
  
  def new
    @user = User.new
  end

  def show
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

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
