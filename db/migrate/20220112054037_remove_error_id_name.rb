class RemoveErrorIdName < ActiveRecord::Migration[6.1]
  def change
    remove_column(:cart_items, :ticket_id_id)
    remove_column(:cart_items, :cart_id_id)
  end
end
