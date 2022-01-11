class RemoveSeatsTicketSerialColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :seats, :ticket_serial, :string
  end
end
