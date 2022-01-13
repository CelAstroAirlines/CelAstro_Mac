class ChangeCartAndCartItem < ActiveRecord::Migration[6.1]
  def change
    remove_column(:carts, :ticket_id)
    remove_column(:carts, :ticket_amount)
  end
end
