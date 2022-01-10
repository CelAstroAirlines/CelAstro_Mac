class Order < ApplicationRecord
  has_many :tickets
  belongs_to :user
  has_many :order_items 
end
