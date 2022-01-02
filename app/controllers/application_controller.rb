class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :init_cart
  include CartsHelper


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private
  def after_sign_in_path_for(resource)
     member_path(current_user)
  end

  # def init_cart
  #   @cart = Cart.from_hash(session[:cart9487])
  # end
end
