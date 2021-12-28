class Cart < ApplicationRecord
  has_many :ticket
  belongs_to :user
end
