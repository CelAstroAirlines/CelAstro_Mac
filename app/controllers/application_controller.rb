class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include CartHelper
  before_action :current_cart
  before_action :configure_permitted_parameters, only: [:create, :update]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :tel])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :tel]) 
    end

    # def permit_attrs(attrs)
    # %i[sign_up account_update].each do |action|
    # action.permit(:first_name, :last_name, :tel)
    # end
  # end

  private
  def after_sign_in_path_for(resource)
     member_path(current_user )
  end

end
