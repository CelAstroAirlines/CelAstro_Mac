class AddColumnsToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :ticket_type, :string
    add_column :tickets, :returning_date, :string
  end
end
