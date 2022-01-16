class Seat < ApplicationRecord
  
  belongs_to :ticket
  
  include AASM
  
  aasm column: 'state' do
    state :vaccant, initial: true
    state :occupied, :booked

    event :empty do
      transitions from: :occupied, to: :vaccant
    end

    event :occupy do
      transitions from: :vaccant, to: :occupied
    end

    event :book do
      transitions from: :occupied, to: :booked
    end
  end
end