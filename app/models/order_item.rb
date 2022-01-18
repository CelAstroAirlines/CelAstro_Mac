class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :ticket
  has_many :seats
end
