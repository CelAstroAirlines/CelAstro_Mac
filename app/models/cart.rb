class Cart < ApplicationRecord
  belongs_to :user
  has_many :tickets
  has_many :cart_items

  SessionKey = :cart2022

  attr_reader :items # getter

  def initialize(items = [])
    @items = items
  end
  
  def add_item(ticket_id)
    found_item = items.find { |item| item.ticket_id == ticket_id }

    if found_item
      found_item.increment
    else
      @items << CartItem.new(ticket_id)
    end
  end

  # return correct hash format
  def serialize
    all_items = items.map { |item|
      { "ticket_id" => item.ticket_id, "quantity" => item.quantity}
    }

    { "items" => all_items }
  end

  # class method
  def self.from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["items"].map { |item_hash|
        CartItem.new(item_hash["ticket_id"])
      }
    end
  end

  # 算出票價總價(目前只會有一個 item)
  def total_price
    items.reduce(0) { |sum, item| sum + item.tax_price }
  end

end
