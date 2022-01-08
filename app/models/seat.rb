class Seat < ApplicationRecord
  
  belongs_to :ticket
  belongs_to :user
  
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

  # def lock(action)
  #   Seat.transaction do
  #     lock!
  #     send.(#{action}!)
  #     save!
  #   end
  # end

  # def hold_seat(current_user)
  #   Seat.transaction do
  #     lock!
  #     update(user_id: current_user) 
  #     save!
  #   end
  # end
  # def lock
  #   if occupied?
  #     Seat.transaction do
  #       lock!
  #       save!
  #     end
  #   elsif booked?
  #     Seat.transaction do
  #       lock!
  #       save!
  #     end
  #   end
  # end

end