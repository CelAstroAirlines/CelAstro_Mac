class Seat < ApplicationRecord
  include AASM
  
  aasm column: 'state' do
    state :vaccant, initial: true
    state :occupied, :booked

    event :vaccant do
      transitions from: [:occupied, :booked], to: :vaccant
    end

    event :occupied do
      transitions from: :vaccant, to: :occupied
    end

    event :booked do
      transitions from: :occupied, to: :booked
    end
  end
end