class Cart < ApplicationRecord
  has_many :tickets
  belongs_to :user
end
