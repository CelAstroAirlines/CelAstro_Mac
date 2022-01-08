class SeatsController < ApplicationController
  # before_action :authenticate_user!
  def show
    @seat = Seat.where(ticket_id: params[:id]).order(:id) 
  end

  def check    
    seat = Seat.find_by(
      ticket_id: params[:id], 
      id: params[:seat]
    )
    ticket_id = params[:ticket_id]

    case
    when seat.vaccant?
      current_user = current_user
      hold_seat(occupy, current_user)
    when seat.occupied?
      if current_user = seat.user_id
        seat.empty!
        seat.update(user_id: nil)
      else
        render html: "don't touch me!!"
      end
    else
    end

    RenewSeatJob.perform_later(ticket_serial, seat)
  end
end
