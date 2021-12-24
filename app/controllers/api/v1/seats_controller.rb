class Api::V1::SeatsController < ApplicationController
  
  def create
    @seat = Seats.new
    render json:{result: "接到了"}
  end
end
