class AddOrdersStateColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :state, :string
  end
end
