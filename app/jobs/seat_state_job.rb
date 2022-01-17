require 'sidekiq-scheduler'
class SeatStateJob < ApplicationJob
  def perform
    Seat.where('updated_at <=?', 10.minutes.ago)
      .each { |seat| seat.empty! if seat.state == 'occupied' }
  end
end