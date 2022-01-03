class AddMoreColumnsToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :departure_time, :string
    add_column :tickets, :arrival_time, :string
    add_column :tickets, :return_departure_airport, :string
    add_column :tickets, :return_arrival_airport, :string
    add_column :tickets, :return_departure_time, :string
    add_column :tickets, :return_arrival_time, :string
  end
end
