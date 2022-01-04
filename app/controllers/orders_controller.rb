class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receivempg]
  def payment
    # p current_cart.total_price
    @form_info = Newebpay::Mpg.new(current_cart.total_price).form_info
  end

  def receivempg
    # render html:params
    @response = Newebpay::MpgResponse.new(params[:TradeInfo])
    if @response.status === "SUCCESS"
       flash.now[:notice] = "付款成功！"
    else
       redirect_to cart_path, notice: '付款過程發生問題'
    end   
  end

  private
  def order_params
    params.require(:cart)
          .permit(:tickets)
          .merge(user: current_user)
  end
end
