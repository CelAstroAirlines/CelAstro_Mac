class Api::V1::SeatsController < ApplicationController
  
  def index
    @seat = Seat.new #給予tickets空位填入班機id
    @ticket_id = params[:id]
  end

  def update_seat
    # render html:params[:id] #這會抓到機號
    # render json:{result: params}
    # render html:params[:seat] #{"seat_no0"=>"true", "seat_no1"=>"true"}
    render html:params[:seat]
  end

  def check
    if params[:seat] == "cbox2" 
      render json: {result: 'false'}
    end
  end



end
