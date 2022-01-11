class AddSeatsTicketIdColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :ticket_id, :integer
  end
end
