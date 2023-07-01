class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :carts

   def has_money_for?(cart)
     balance >= cart.total
   end

   def pay_and_checkout!(cart)
      pay!(cart.total) && cart.checkout! if has_money_for?(cart)
   end

   def pay!(total)
     update(balance: balance - total)
   end
end
