class Admin::ApplicationController < ApplicationController

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Admin access denied."
    end
  end
  
end