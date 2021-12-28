class ReceiptsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  # def payment
  #   @form_info = Newebpay::Mpg.new.form_info
  # end

  def create
    render html:"123"

  end

  

end
