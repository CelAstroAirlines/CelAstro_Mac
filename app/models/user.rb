class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :trackable 


  after_save :add_carts

  has_many :tickets
  has_many :carts

  def add_carts
    if carts.blank?
      Cart.buy_now.create(user: self)
    end
  end

  def buy_now_cart
    carts.buy_now.first
  end

  def buy_now_cart_items
    buy_now_cart.cart_items
  end

end
