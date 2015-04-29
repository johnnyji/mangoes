class Admin::UsersController < Admin::ApplicationController
  before_action :require_admin
  before_action :find_user, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @admins = User.where(admin: true).where.not(id: current_user.id).order('created_at DESC')
    @users = User.where(admin: false).page(params[:page]).per_page(10).order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "#{@user.name} was successfully updated"
    else
      flash.now[:alert] = "Oops, something went wrong"
      render :edit
    end
  end

  def delete
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "User has been successfully deleted"
  end

  def preview_user
    @preview_user = User.find(params[:id])
    session[:preview_user_id] = @preview_user.id
    redirect_to movies_path, notice: "You are now in preview as #{@preview_user.name}"
  end

  def back_as_admin
    session[:preview_user_id] = nil
    redirect_to admin_users_path, notice: "You are back as #{current_user.name}"
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin)
  end

end
