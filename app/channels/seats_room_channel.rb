class SeatsRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "seats_room_channel_#{params[:ticket_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
