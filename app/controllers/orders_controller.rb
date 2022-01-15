class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :destroy]
  # before_action :verify_auth
  skip_before_action :verify_authenticity_token, :only => [:receivempg]

  def create
    @cart = current_cart
    @order = Order.create(
      ticket_id: current_user.cart.cart_items.ticket.ticket_id,
      user_id: current_user.id,
      order_timestamp: Time.now.strftime('%Y/%m/%d %H:%M:%S')
    )
    # current_user.buy_now_cart_items.each do |order_item|
    #   OrderItem.create (
    #     order_id: @order,
    #     ticket_id: cart_items.ticket.ticket_id,
    #     quantity: cart_items.quantity,
    #     price: cart_items.ticket.ticket_amount
    #   )
    # end
    # current_user.buy_now_cart_items.destroy_all
  end
  

  def payment
    @form_info = Newebpay::Mpg.new(current_user.buy_now_cart.total_price).form_info
    @order = Order.create(order_params)
  end

  def receivempg
    @response = Newebpay::MpgResponse.new(params[:TradeInfo])
    if @response.status === "SUCCESS"
       flash.now[:notice] = "付款成功！"
       OrderMailer.notify_order('#{current_user.email}').deliver
      OrderMailJob.perform_later
      # sign_in current_user 
    else
       redirect_to cart_items_path, notice: '付款過程發生問題'
    end   
  end


  private 
  def set_order
    @order = Order.find_by(id: params[:id])
    if !@order
      flash[:notice] = "查無訂單"
    end
  end

  # def verify_auth
  #   if @order 
  #     unless current_user.is_admin? || (current_user == @order.user)
  #     flash[:notice] = "你沒有權限"
  #     redirect_to root_path 
  #     end
  #   end
  # end

  def order_params
    # params.require(:cart).permit(:total_price)
  end
  
end

  