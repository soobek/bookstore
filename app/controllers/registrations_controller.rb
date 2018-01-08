class RegistrationsController < Devise::RegistrationsController

  private

  def sing_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_role,
      :nick, :password, :password_confirmation)
  end

  def sing_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_role,
      :nick, :password, :password_confirmation, :current_password)
  end
end
