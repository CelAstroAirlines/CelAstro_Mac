class AddSeatNumber < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :seat_id, :integer
  end
end
