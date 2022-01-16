class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:receivempg]
  before_action :set_order, only: [:show, :edit, :destroy]
  # before_action :verify_auth
  skip_before_action :verify_authenticity_token, :only => [:receivempg]

  def create
    # @cart = current_cart
    @order = Order.create(
      user_id: current_user.id,
      order_timestamp: Time.now.strftime('%Y%m%d%H%M%S'),
      sellign_amount: current_user.buy_now_cart.total_price
    )
    
    current_user.buy_now_cart_items.each do |order_item|
      OrderItem.create(
        order_id: @order.id,
        ticket_id: order_item.ticket_id,
        quantity: order_item.quantity,
        price: Ticket.find(order_item.ticket_id).ticket_amount.to_i 
      )
    end
    current_user.buy_now_cart.cart_items.destroy_all
    redirect_to payment_orders_path
  end
  

  def payment
    @form_info = Newebpay::Mpg.new(current_user.orders.last.sellign_amount, current_user.orders.last.order_timestamp, current_user.id).form_info
  end

  def receivempg
    @response = Newebpay::MpgResponse.new(params[:TradeInfo])
    @order = Order.find_by(order_timestamp: @response.order_no)
    sign_in @order.user
    if @response.status === "SUCCESS"    
       flash.now[:notice] = "付款成功！"
       @order.pay!
      OrderMailer.notify_order('#{@user.email}').deliver
      # OrderMailJob.perform_later
    else
      @order.cancel!
      redirect_to search_tickets_path, notice: '付款過程發生問題'
    end 
  end

  def show
  end

  def destroy
    @order.refund!
    #金流流程
    RefundMailer.notify_order('#{current_user.email}').deliver
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

  