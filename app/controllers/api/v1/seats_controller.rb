class Api::V1::SeatsController < ApplicationController
  
  def create
    @seat = Seat.new

  end
  def update
    render json:{result: "接到了"}
  end


end
