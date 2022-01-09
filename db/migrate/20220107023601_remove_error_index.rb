class RemoveErrorIndex < ActiveRecord::Migration[6.1]
  def change
    remove_column(:carts, :ticket_id)
    remove_column(:carts, :ticket_amount)
    remove_column(:carts, :carts_id_id)
    remove_column(:tickets, :tickets_id_id)
  end
end
