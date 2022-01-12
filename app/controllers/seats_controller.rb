class SeatsController < ApplicationController
  # before_action :authenticate_user!
  def show  
    @seat = Seat.where(ticket_id: params[:id]).order(:id)
    @ticket = Ticket.where(ticket_id: params[:id]) 
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
    # render json:{current_user: current_user.id}
    # seat.hold_seat(current_user.id)
    # if seat.user_id == current_user.id && seat.user_id != nil
    case
    when seat.vaccant?
      # seat.hold_seat(current_user)
      seat.update(user_id: current_user.id)
      seat.occupy!
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

  
end
