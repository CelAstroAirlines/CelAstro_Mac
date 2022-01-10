class ApplicationController < ActionController::Base  
  include CartHelper
  before_action :current_cart
end
