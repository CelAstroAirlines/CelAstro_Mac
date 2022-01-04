class CartItem < ApplicationRecord
  attr_reader :ticket_id, :quantity # getter

  def initialize(ticket_id, quantity = 1)
    @ticket_id = ticket_id
    @quantity = quantity
  end

  def increment(n = 1)
    @quantity += n
  end

  def ticket
    Ticket.find_by(id: ticket_id)
  end

  def price
    ticket.ticket_amount * quantity
  end

  def fuel_surcharge
    (price * 0.01).ceil
  end

  def airport_service_fee
    (price * 0.02).ceil
  end

  def tax_price
    price + fuel_surcharge + airport_service_fee
  end

end
