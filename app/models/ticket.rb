class Ticket < ApplicationRecord
  has_many :cart_items
  has_many :seats
  # has_many :users

  # 開了 rails db:seed 會失敗
  # belongs_to :user
  # validates :departure, presence: true
  # validates :arrival, presence: true 
  # validates :departure_date, presence: true
  
  private
  def ticket_quantity_sold
    @order = Order.find_by(id: params[:id])
    if @order.state == "paid"
      ticket = @order.order_item.ticket_id
      #ticket_item_serial = ticket.ticket_serial
      if ticket.ticket_type == "one_way"
        Ticket.transaction do
          ticket.lock!
          ticket.quantity -= 1 
          ticket.save!
        end
        if ticket.ticket_serial == Ticket.where(ticket_serial: ticket[:ticket_serial][0..13], ticket_type: "roundtrip").or(Ticket.where(ticket_serial: ticket[:ticket_serial][14..], ticket_type: "roundtrip"))
          roundtrip_ticket = Ticket.where(ticket_serial: ticket[:ticket_serial][0..13], ticket_type: "roundtrip").or(Ticket.where(ticket_serial: ticket[:ticket_serial][14..], ticket_type: "roundtrip"))
          Ticket.transaction do
            roundtrip_ticket.lock!
            roundtrip_ticket.quantity -= 1
            roundtrip_ticket.save!
          end
        end
      elsif ticket.ticket_type == "roundtrip"
        Ticket.transaction do
          ticket.lock!
          ticket.quantity -= 1
          ticket.save!
        end
        ticket1 = Ticket.where(ticket_serial: ticket[:ticket_serial][0..13], ticket_type: "one_way")
        Ticket.transaction do
          ticket1.lock!
          ticket1.quantity -= 1
          ticket1.save!
        end
        ticket2 = Ticket.where(ticket_serial: ticket[:ticket_serial][14..], ticket_type: "one_way")
        Ticket.transaction do
          ticket2.lock!
          ticket2.quantity -= 1
          ticket2.save!
        end
      end
    end
  end

  def ticket_quantity_cancelled
    @order = Order.find_by(id: params[:id])
    if @order.state == "cancelled" || "refunded"
      ticket = @order.order_item.ticket_id
      if ticket.ticket_type == "one_way"
        Ticket.transaction do
          ticket.lock!
          ticket.quantity += 1 
          ticket.save!
        end
        if ticket.ticket_serial == Ticket.where(ticket_serial: ticket[:ticket_serial][0..13], ticket_type: "roundtrip").or(Ticket.where(ticket_serial: ticket[:ticket_serial][14..], ticket_type: "roundtrip"))
          roundtrip_ticket = Ticket.where(ticket_serial: ticket[:ticket_serial][0..13], ticket_type: "roundtrip").or(Ticket.where(ticket_serial: ticket[:ticket_serial][14..], ticket_type: "roundtrip"))
          Ticket.transaction do
            roundtrip_ticket.lock!
            roundtrip_ticket.quantity += 1
            roundtrip_ticket.save!
          end
        end
      elsif ticket.ticket_type == "roundtrip"
        Ticket.transaction do
          ticket.lock!
          ticket.quantity += 1
          ticket.save!
        end
        ticket1 = Ticket.where(ticket_serial: ticket[:ticket_serial][0..13], ticket_type: "one_way")
        Ticket.transaction do
          ticket1.lock!
          ticket1.quantity += 1
          ticket1.save!
        end
        ticket2 = Ticket.where(ticket_serial: ticket[:ticket_serial][14..], ticket_type: "one_way")
        Ticket.transaction do
          ticket2.lock!
          ticket2.quantity += 1
          ticket2.save!
        end
      end
    end
  end
end

