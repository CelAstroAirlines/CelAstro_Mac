class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receipts]
  def payment
    @form_info = Newebpay::Mpg.new.form_info
  end
end
