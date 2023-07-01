class Cart < ApplicationRecord

	has_many :cart_items
	belongs_to :user

	def subtotal
		cart_items.inject(0) do |sum, item|
			sum + item.product.price.to_i
		end
	end

  def tax
    subtotal * 0.1
  end

  def total
    subtotal + tax
  end

  def checkout!
    update(checked_out: true)
  end
end