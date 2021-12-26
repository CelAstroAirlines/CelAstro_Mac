class RemoveAirportFromTicket < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :airport, :string
  end
end