class SeatsController < ApplicationController
  # before_action :authenticate_user!
  def show  
    if user_tickets(current_user).include?(params[:id].to_i)
      @seat = Seat.where(ticket_id: params[:id]).order(:id)
      @ticket = Ticket.where(ticket_id: params[:id])
      @user_id = current_user.id 
    else
      redirect_to :root, alert:"請先購買機票"
    end
  end

  def finished
    Seat.where(ticket_id: params[:id], user_id: current_user.id).each do |s|
      if s.occupied?
        s.book!
        RenewSeatJob.perform_now(params[:ticket_id], s)
      end
    end
  end

  def confirm
    @seat = Seat.where(
      ticket_id: params[:id], 
      user_id: current_user.id,
      state: "occupied"
    ).order(:id)
    @user = User.find_by(id: current_user.id)
    @ticket = Ticket.find_by(id: params[:id])
  end


  def check    
    seat = Seat.find_by(
          ticket_id: params[:id], 
          id: params[:seat]
        )
    ticket_id = params[:ticket_id]
    case
    when seat.vaccant?
      if seats_count < order_seat_quantity(current_user, params[:id])
        seat.update(user_id: current_user.id)
        seat.occupy!
      else
      end
    when seat.occupied?
      if current_user.id == seat.user_id || seat.user_id == nil
        seat.empty!
        seat.update(user_id: current_user.id)
      else
        render json: { result: 'failed'}
      end
    else
    end
    RenewSeatJob.perform_now(params[:ticket_id], seat)  
  end

  private
  
  def check_order_info(user)
    order_items_ids = []
    all_orders = user.orders.all
    all_orders.each do |order|
      if order.state === 'paid'
        order_items_id = order.order_items.ids
        order_items_ids << order_items_id
      end
    end
    order_items_ids = order_items_ids.flatten
    order_items_ids
  end

  def order_seat_quantity(user, ticket_id)
    total_count = 0  
    check_order_info(user).each do |item_id|
      if ticket_id.to_i === OrderItem.find(item_id).ticket_id
        total_count +=  OrderItem.find(item_id).quantity.to_i
      end
    end
    total_count
  end

  def user_tickets(user)
    ticket_ids = []
    check_order_info(user).each do |item_id|
      ticket_id = OrderItem.find(item_id).ticket_id
      ticket_ids << ticket_id
    end
    ticket_ids

  end

  def seats_count
    occupied_seat = Seat.where(
      ticket_id: params[:id],
      state: "occupied",
      user_id: current_user.id
    )

    booked_seat = Seat.where(
      ticket_id: params[:id],
      state: "booked",
      user_id: current_user.id
    )
    user_occupied_booked_count = occupied_seat.count + booked_seat.count
  end

  
end
