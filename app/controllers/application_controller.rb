class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
  def after_sign_up_path_for(resource)
    flash[:notice] = "you have signed up successfully" 
    user_path(resource)
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  protected

  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end