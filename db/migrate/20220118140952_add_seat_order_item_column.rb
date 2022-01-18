class AddSeatOrderItemColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :order_item_id, :bigint
  end
end
