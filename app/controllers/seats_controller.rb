class SeatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @seat = Seat.where(ticket_serial: params[:id]).order(:id) 
  end

  def check    
    @seat = Seat.find_by(
      ticket_serial: params[:id], 
      id: params[:seat]
    )
    ticket_serial = params[:ticket_serial]

    if @seat.state == "vaccant" 
      @seat.occupied!
      @seat.update(user_id: current_user)
    elsif @seat.state == "occupied" 
      @seat.vaccant!
      @seat.update(user_id: nil)      
    end
    RenewSeatJob.perform_later(ticket_serial, @seat)
  end
end