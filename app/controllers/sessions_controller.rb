class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticated(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back #{current_user.name}"
    else
      flash.now[:alert] = "Login failed."
      render :new
    end
  end

  def destroy
  end

end
