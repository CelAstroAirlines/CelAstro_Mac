class RemoveOrdersColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :serial, :string
    remove_column :orders, :order_ticket_count, :integer
    remove_column :orders, :cabin_class, :string
    remove_column :orders, :return_departure_time, :string
    remove_column :orders, :return_arrival_airport, :string
    remove_column :orders, :return_departure_airport, :string
    remove_column :orders, :ticket_type, :string
    remove_column :orders, :departure_date, :string
    remove_column :orders, :ticket_serial, :string
    remove_column :orders, :arrival, :string
    remove_column :orders, :departure, :string
    remove_column :orders, :slug, :string
  end
end
