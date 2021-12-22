class AddTicketIdToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :ticket_id, :string
  end
end
