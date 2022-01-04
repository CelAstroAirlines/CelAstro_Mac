class AddQuantitytoTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :quantity, :integer  
  end
end
