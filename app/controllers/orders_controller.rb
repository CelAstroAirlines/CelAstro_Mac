class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receivempg]
  # before_action  :authenticate_user!, only: [:payment]
    before_action :user_signed_in?
  def payment
    @form_info = Newebpay::Mpg.new(current_cart.total_price).form_info
  end
  # new(current_cart.total_price)上面要帶進去的參數目前無法執行
  def receivempg
    @response = Newebpay::MpgResponse.new(params[:TradeInfo])
    if @response.success?
      #  @response.save
       flash.now[:notice] = "付款成功！"
    else
       redirect_to cart_path, notice: '付款過程發生問題'
    end   
  end 
end
