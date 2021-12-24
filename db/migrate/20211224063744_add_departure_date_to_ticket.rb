class AddDepartureDateToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :departure_date, :string
  end
end
