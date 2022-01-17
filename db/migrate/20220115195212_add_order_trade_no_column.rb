class AddOrderTradeNoColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :trade_no, :string
  end
end
