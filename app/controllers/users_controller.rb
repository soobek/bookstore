class UsersController < ApplicationController

layout 'admin'

  before_action :authenticate_user!, :is_admin?

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
  	@user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted."
      redirect_to users_path
    else
      flash[:notice] = "Faild to user delete."
      redirect_to users_path
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
      flash[:notice] = "User updated."
      redirect_to users_path
    else
      flash[:notice] = "Faild to user edit."
      render("edit")
    end
  end

private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :nick, :user_role, :email)
  end

  def is_admin?
    unless current_user.user_role == "admin"
      flash[:alert] = "You don't have admin permition."
      redirect_to root_path  
    end
  end

end
