class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receipts]
  # def create
     # 要記得附上該筆訂單的資訊，才有辦法建立付款喔！
     # order = Order.find(1)
  #   @form_info = Newebpay::Aaa.new().form_info
  # end
  def payment
    @form_info = Newebpay::Mpg.new.form_info
  end

  def receipt
    render html:"123"

  end

  

end
