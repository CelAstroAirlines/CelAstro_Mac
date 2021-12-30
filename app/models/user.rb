class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :validatable

=======
         :recoverable, :rememberable, :validatable,  :trackable 
>>>>>>> 71bef59 (新增 last sign in time)

  has_many :tickets
  has_one :cart
end
