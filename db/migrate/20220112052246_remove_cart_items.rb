class RemoveCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :ticket_id, index: true
    add_reference :cart_items, :cart_id, index: true
  end
end
