class Ticket < ApplicationRecord
  validates :departure, presence: true
  validates :arrival, presence: true 
  validates :departure_date, presence: true
  
end
