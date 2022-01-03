class FixColumnNameToTicket < ActiveRecord::Migration[6.1]
  def change
    rename_column :tickets, :ticket_id, :ticket_serial
  end
end
