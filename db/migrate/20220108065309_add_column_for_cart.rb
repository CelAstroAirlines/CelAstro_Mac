class AddColumnForCart < ActiveRecord::Migration[6.1]
  def change
    add_column(:carts, :cart_type, :integer)
  end
end
