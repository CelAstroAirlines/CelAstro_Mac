class Api::V1::SeatsController < ApplicationController

  def create
    ticket_id = Seat.find_by(ticket_id: params[:id])
    if ticket_id == 'true'
      redirect_to action: "show", id: params[:id]
    else
    end
      
  end

  
  def index
    @seat = Seat.all #給予tickets空位填入班機id
    @ticket_id = params[:id]
  end

  def update_seat
    # render html:params[:id] #這會抓到機號
    # render json:{result: params}
    # render html:params[:seat] #{"seat_no0"=>"true", "seat_no1"=>"true"}
    render html:params[:seat]
  end

  def check
    render html:params
    if params[:seat] == "cbox2" 
      render json: {result: 'false'}
    else
      ActionCable.server.broadcast "seats_room_channel_#{params[:id]}", message: "hello"
    end
  end



end
