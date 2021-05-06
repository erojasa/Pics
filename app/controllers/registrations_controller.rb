class RegistrationsController < Devise::RegistrationsController
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :password, :password_confirmation, :current_password])
  end
  

  # def sign_up_params
  #   params.require(:user).permit(:email, :name, :password, :password_confirmation)
  # end
  
  # def account_update_params
  #   params.require(:user).permit(:email, :name, :password, :password_confirmation, :current_password)
  # end
  
end