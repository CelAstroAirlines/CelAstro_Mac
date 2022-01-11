class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receivempg]

  def create
    @cart = current_cart
    @order = current_user.orders.new(order_params)
    @order.sellign_amount = current_cart.total_price
    @order.serial 
    @order.order_timestamp = Time.now.strftime('%Y/%m/%d %H:%M:%S')
    @order.save
  end

  def payment
    @form_info = Newebpay::Mpg.new(current_cart.total_price).form_info
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


  
  def destroy 
    @order = Order.find(params[:id])
    @order = Order.delete
  end

  private 
  def order_params
    params.require(:order).permit(:sellign_amount, :user_id, :ticket_serial, :cabin_class, :order_ticket_count)
  end
  
end

  