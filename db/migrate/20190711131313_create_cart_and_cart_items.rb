class CreateCartAndCartItems < ActiveRecord::Migration[5.2]
  def change
  	create_table :carts do |t|
  		t.references :user

  		t.timestamps
  	end

  	create_table :cart_items do |t|
  		t.references :cart
  		t.references :product

  		t.integer :qty

  		t.timestamps
  	end
  end
end
