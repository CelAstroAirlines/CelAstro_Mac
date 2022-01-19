class RemoveOrderTradeNoColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :trade_no, :string
  end
end
