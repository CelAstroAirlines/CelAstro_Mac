class CartItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :cart
  has_one :user, through: :cart # get cart's user

  def price
    ticket.ticket_amount
  end

  def fuel_surcharge
    (price * 0.01).ceil
  end

  def airport_service_fee
    (price * 0.02).ceil
  end

  def tax_price
    (price + fuel_surcharge + airport_service_fee) * quantity
  end

end
