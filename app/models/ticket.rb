class Ticket < ApplicationRecord
  has_many :cart_items
  has_many :seats
  
  validates :departure, presence: true
  validates :arrival, presence: true 
  validates :departure_date, presence: true
  
end
