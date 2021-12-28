class SeatStateJob < ApplicationJob
  queue_as :default
  def perform(f)
    html = ApplicationController.render(
      partial: 'seat',
      locals: {f: f}
    )
    ActionCable.server.broadcast "seats_room_channel_ATEST123", html: html
  end
end
