class AddColumnCartItemAndCart < ActiveRecord::Migration[6.1]
  def change
    add_column(:cart_items, :quantity, :integer)
  end
end
