class Ticket < ApplicationRecord
  has_many :cart_items
  has_many :seats

  # 開了 rails db:seed 會失敗
  # belongs_to :user
  # validates :departure, presence: true
  # validates :arrival, presence: true 
  # validates :departure_date, presence: true
  
end
