class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
  end

  def admin_in_preview_mode
    if session[:admin_id]
      @admin_in_preview_mode ||= User.find(session[:admin_id])
    else
      false
    end
  end

  def restrict_access
    unless current_user
      flash[:alert] = "You must be logged in first!"
      redirect_to new_session_path
    end
  end

  helper_method :admin_in_preview_mode
  helper_method :current_user
end
