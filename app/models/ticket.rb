class Ticket < ApplicationRecord
  has_many :cart_items
<<<<<<< HEAD
  has_many :seats
=======
  belongs_to :user
>>>>>>> 9d605e4be9023b754ef895a72c641df47cad0c0d
  
  validates :departure, presence: true
  validates :arrival, presence: true 
  validates :departure_date, presence: true
  
end
