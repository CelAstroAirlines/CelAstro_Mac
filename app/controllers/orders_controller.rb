class OrdersController < ApplicationController
  # before_action :set_order
  skip_before_action :verify_authenticity_token, :only => [:receivempg]

  def create
    @cart = current_cart
    @order.sellign_amount = @payment_amt
    @order = current_user.orders.new
    @order.serial 
    @order.order_timestamp = Time.now.strftime('%Y/%m/%d %H:%M:%S')
    @order.save
  end

  def payment
    @form_info = Newebpay::Mpg.new(current_cart.total_price).form_info
    # @order = Order.create(order_params)
  end

  def receivempg
    @response = Newebpay::MpgResponse.new(params[:TradeInfo])
    if @response.status === "SUCCESS"
       flash.now[:notice] = "付款成功！"
       OrderMailer.notify_order('#{current_user.email}').deliver
      OrderMailJob.perform_later
    else
       redirect_to cart_path, notice: '付款過程發生問題'
    end   
  end


  private 
  # def set_order
  #   @order = current_order
  # end

  def order_params
    # params.require(:cart).permit(:total_price)
  end
  
end

  