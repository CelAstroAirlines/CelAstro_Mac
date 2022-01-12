class UpdateCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :ticket, index: true
    add_reference :cart_items, :cart, index: true
  end
end
