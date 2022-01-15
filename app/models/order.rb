class Order < ApplicationRecord
  has_many :tickets
  belongs_to :user
  has_many :order_items 

  # include AASM

  # aasm column: "state" do 
  #   state :pending, initial: true
  #   state :paid, :cancelled, :refunded 

  #   event :pay do
  #     transitions from: :pending, to: :paid
  #   end

  #   event :cancel do
  #     transitions from: [:pending, :paid], to: :cancelled
  #   end

  #   event :refund do
  #     transitions from: [:paid, :cancelled], to: :refunded 
  #   end
  # end
end

