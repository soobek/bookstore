class AdminPanelController < ApplicationController
  
layout 'admin'

		before_action :authenticate_user!, :is_admin?

  def index
  	@user = User.all
  end

 private

  def is_admin?
  	unless current_user.user_role == "admin"
  		flash[:alert] = "You don't have admin permition."
  		redirect_to root_path	
  	end
  end

end
