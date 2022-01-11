class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, only: [:create, :update]
  before_action :configure_permitted_parameters, :if => :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :tel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :tel]) 
  end
  
  def after_sign_in_path_for(resource)
    member_path(current_user)
  end
end

