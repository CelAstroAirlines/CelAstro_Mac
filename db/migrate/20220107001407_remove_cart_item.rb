class RemoveCartItem < ActiveRecord::Migration[6.1]
  def change
    drop_table(:cart_items)
  end
end
