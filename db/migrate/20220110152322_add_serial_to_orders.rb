class AddSerialToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :serial, :string
  end
end
