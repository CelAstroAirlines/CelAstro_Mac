class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :seat_id, :integer
    rename_column :seats, :plane_id, :ticket_serial
    rename_column :seats, :seat_id, :seat_no
  end
end
