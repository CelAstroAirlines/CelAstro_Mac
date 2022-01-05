class Api::V1::SeatsController < ApplicationController
  # before_action :authenticate_user!
  def create
    ticket_id = Seat.find_by(ticket_id: params[:id])
    if ticket_id == 'true'
      redirect_to action: "show", id: params[:id]
    else
    end
      
  end

  
  def index
    @seat = Seat.where(:ticket_serial =>params[:id]).order(:id) 
  end

  def update_seat

  end

  def check    

    @seat = Seat.find_by(
      ticket_serial: params[:id], 
      id: params[:seat]
    )

    if @seat.state == "vaccant" 
      @seat.occupied!
      # @seat.update(user_id: current_user)
    elsif @seat.state == "occupied" 
      @seat.vaccant!
      # @seat.update(user_id: nil)      
    end
    
    ActionCable.server.broadcast "seats_room_channel_#{params[:ticket_serial]}", {
      seat_params: @seat,
      message: render(partial: 'seat', locals:{f:@seat})
    }

  end

end
