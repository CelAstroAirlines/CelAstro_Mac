class CartItem < ApplicationRecord
  attr_reader :ticket_id, :quantity # getter

  def initialize(ticket_id, quantity = 1)
    @ticket_id = ticket_id
    @quantity = quantity
  end

  def increment(n = 1)
    @quantity += n
  end

  # 會根據目前這條 item 的 ticket_id 查出產品是什麼？
  def ticket
    Ticket.find_by(id: ticket_id)
  end

  # 算出票價總價(只會有一個 item)
  def total_price
    ticket.ticket_amount * quantity
  end
end
