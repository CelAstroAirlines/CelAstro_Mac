class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include CartsHelper
  before_action :current_cart

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private
  def after_sign_in_path_for(resource)
     member_path(current_user)
  end

end
