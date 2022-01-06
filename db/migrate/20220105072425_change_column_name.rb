class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :seats, :plane_id, :ticket_serial
    rename_column :seats, :seat_id, :seat_no
  end
end
