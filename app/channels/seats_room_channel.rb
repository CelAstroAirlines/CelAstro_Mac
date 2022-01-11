class SeatsRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "seats_room_channel_#{params[:ticket_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
