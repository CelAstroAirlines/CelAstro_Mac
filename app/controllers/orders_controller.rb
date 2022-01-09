class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receivempg]
  def payment
    @form_info = Newebpay::Mpg.new().form_info
  end

  def receivempg
    @response = Newebpay::MpgResponse.new(params[:TradeInfo])
    if @response.status === "SUCCESS"
       flash.now[:notice] = "付款成功！"
    else
       redirect_to cart_path, notice: '付款過程發生問題'
    end   
  end
end
