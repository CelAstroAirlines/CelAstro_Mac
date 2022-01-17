class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:receivempg]
  before_action :set_order, only: [:show, :edit, :destroy]
  # before_action :verify_auth
  skip_before_action :verify_authenticity_token, :only => [:receivempg]

  def index
    @order = current_user.orders.all.order(:id)
  end

  def show
    @order_item = Order.find(params[:id]).order_items.all
    @ticket_info = tickets_info
  end
  def create
    # @cart = current_cart
    @order = Order.create(
      user_id: current_user.id,
      order_timestamp: Time.now.strftime('%Y%m%d%H%M%S'),
      sellign_amount: current_user.buy_now_cart.total_price
    )
    
    current_user.buy_now_cart_items.each do |order_item|
      ticket = Ticket.find(order_item.ticket_id)
      if ticket.ticket_serial.length < 15
        OrderItem.create(
          order_id: @order.id,
          ticket_id: order_item.ticket_id,
          quantity: order_item.quantity,
          price: Ticket.find(order_item.ticket_id).ticket_amount.to_i 
        )
      else
        ticket_first = Ticket.find_by(ticket_serial: ticket.ticket_serial[0..13])
        ticket_second = Ticket.find_by(ticket_serial: ticket.ticket_serial[14..28])
        OrderItem.create(
          order_id: @order.id,
          ticket_id: ticket_first.id,
          quantity: order_item.quantity,
          price: Ticket.find(order_item.ticket_id).ticket_amount.to_i 
        )
        OrderItem.create(
          order_id: @order.id,
          ticket_id: ticket_second.id,
          quantity: order_item.quantity,
          price: Ticket.find(order_item.ticket_id).ticket_amount.to_i 
        )
      end

    
    end
    current_user.buy_now_cart.cart_items.destroy_all
    redirect_to payment_orders_path(order_timestamp: current_user.orders.last.order_timestamp)
  end
  

  def payment
    order_timestamp = params["order_timestamp"]
    sellign_amount = current_user.orders.find_by(order_timestamp: params["order_timestamp"]).sellign_amount
    @form_info = Newebpay::Mpg.new(sellign_amount, order_timestamp, current_user.id).form_info
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

  def refund
    @order = Order.find_by(order_timestamp: params["order_timestamp"])
    if @order.paid?
      @order.refund!
      cancel_seat_state(@order)
    else
    end
    redirect_to "/orders", method: :get
  end


  private 
  def set_order
    @order = Order.find_by(id: params[:id])
    if !@order
      flash[:notice] = "查無訂單"
    end
  end

  def all_tickets_id
    ticket_ids = []
    Order.find(params[:id]).order_items.all.each do |items|
      ticket_ids << items.ticket_id
    end
    ticket_ids
  end
  
  def tickets_info
    tickets_details  = []
    all_tickets_id.each do |ticket|
      tickets_details << Ticket.find(ticket)
    end
    tickets_details
  end

  def refund_ticket_ids(order)
    ticket_ids = []
    order.order_items.each do |item|
      ticket_ids << item.ticket_id
    end
    ticket_ids
  end
  
  def seats_info(order)
    seat = []
    seat_ids = []
    refund_ticket_ids(order).each do |ticket_id|
      seat << Seat.where(ticket_id: ticket_id, user_id: current_user.id, state: "booked")
      seat_ids << seat.first.ids
    end
    seat_ids.flatten
  end

  def cancel_seat_state(order)
    seats_info(order).each do |seat_id|
      seat = Seat.find(seat_id)
      if seat.occupied? || seat.booked?
        seat.empty!
      else
      end
    end
  end
end

  