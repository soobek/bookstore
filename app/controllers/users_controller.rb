class UsersController < ApplicationController

  def index
  	@user = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def delete
  	@user = User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    redirect_to(:action => 'index')
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
      flash[:notice] = "User updated."
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end
private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :nick, :user_role, :email)
  end

end
