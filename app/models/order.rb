class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items 
  
  enum cart_type: [:not_paid, :paid, :cancelled]


  include AASM

  aasm column: "state" do 
    state :pending, initial: true
    state :paid, :cancelled, :refunded 

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :cancel do
      transitions from: [:pending, :paid], to: :cancelled
    end

    event :refund do
      transitions from: [:paid, :cancelled], to: :refunded
    end
  end
end

