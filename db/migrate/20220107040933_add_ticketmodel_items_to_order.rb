class AddTicketmodelItemsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :departure, :string 
    add_column :orders, :arrival, :string 
    add_column :orders, :ticket_serial, :string 
    add_column :orders, :departure_date, :string 
    add_column :orders, :ticket_type, :string 
    add_column :orders, :return_departure_airport, :string 
    add_column :orders, :return_arrival_airport, :string 
    add_column :orders, :return_departure_time, :string 
    add_column :orders, :cabin_class, :string 
  end
end
