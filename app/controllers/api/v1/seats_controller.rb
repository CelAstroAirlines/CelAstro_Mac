class Api::V1::SeatsController < ApplicationController

  def create
    ticket_id = Seat.find_by(ticket_id: params[:id])
    if ticket_id == 'true'
      redirect_to action: "show", id: params[:id]
    else
    end
      
  end

  
  def index
    @seat = Seat.where(:plane_id =>"ATEST123").order(:id) #給予tickets空位填入班機id
  end

  def update_seat
    render html:params
    # render html:params[:id] #這會抓到機號
    # render json:{result: params}
    # render html:params[:seat] #{"seat_no0"=>"true", "seat_no1"=>"true"}
    
  end

  def check    
    @seat = Seat.find_by(
      :plane_id =>params[:id], 
      :seat_id=> params[:seat][:seat_id], 
      :area => params[:seat][:area]
    )

    if @seat.state == "vaccant" 
      @seat.occupied!
    elsif @seat.state == "occupied" 
      @seat.vaccant!      
    end
    


    ActionCable.server.broadcast "seats_room_channel_#{params[:plane_id]}", {
      id: @seat,
      message: render(partial: 'seat', locals:{f:@seat})
    }

  end



end
