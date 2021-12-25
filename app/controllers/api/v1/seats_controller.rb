class Api::V1::SeatsController < ApplicationController
  
  def create
    @seat = Seat.new #給予tickets空位填入班機id
  end

  def update_seat
    # render html:params[:id] #這會抓到機號
    # render json:{result: params}
    # render html:params[:seat] #{"seat_no0"=>"true", "seat_no1"=>"true"}
    render html:params[:seat]
  end



end
