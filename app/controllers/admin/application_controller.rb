class Admin::ApplicationController < ApplicationController

  def require_admin
    if !current_user.admin && !User.find(session[:admin_id]).admin
      redirect_to root_path, alert: "Admin access denied."
    end
  end
  
end