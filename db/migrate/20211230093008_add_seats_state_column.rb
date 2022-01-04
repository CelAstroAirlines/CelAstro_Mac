class AddSeatsStateColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :state, :string
  end
end
