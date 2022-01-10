class AddTicketCountToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_ticket_count, :integer
  end
end
