class RenewSeatJob < ApplicationJob
  queue_as :default

  def perform(ticket_serial, seat)
    ActionCable.server.broadcast "seats_room_channel_#{ticket_id}", {
      seat_params: seat,
      message: ApplicationController.render(partial: 'seats/seat', locals:{f:seat})
    }
  end
end
