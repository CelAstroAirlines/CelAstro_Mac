class SeatsRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "seats_room_channel_#{params[:plane_id]}"
    # stream_from "seats_room_channel_ATEST123"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
