class RemoveOrdersTicketIdColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :ticket_id, :bigint
  end
end
