# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, only: [:create, :update]

  def after_sign_up_path_for(resource)
    member_path(current_user)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :tel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :tel]) 
  end
end
