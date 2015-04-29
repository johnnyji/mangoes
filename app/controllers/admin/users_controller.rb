class Admin::UsersController < Admin::ApplicationController
  before_action :require_admin
  before_action :find_user, except: [:index]

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

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin)
  end

end
