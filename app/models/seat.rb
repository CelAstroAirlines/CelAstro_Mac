class Seat < ApplicationRecord
  include AASM
  after_save_commit :lock
  # def lock(action)
  #   Seat.transaction do
  #     lock!
  #     send.(#{action}!)
  #     save!
  #   end
  # end
  
  aasm column: 'state' do
    state :vaccant, initial: true
    state :occupied, :booked

    event :vaccant do
      transitions from: :occupy, to: :vaccant
    end

    event :occupy do
      transitions from: :vaccant, to: :occupy
    end

    event :book do
      transitions from: :occupy, to: :book
    end
  end

  def lock
    if seat.occupy?
      Seat.transaction do
        seat.lock!
        seat.user_id = current_user
        seat.save!
      end
    elsif seat.book?
      Seat.transaction do
        seat.lock!
        seat.user_id = current_user
        seat.save!
      end
    end
  end

end