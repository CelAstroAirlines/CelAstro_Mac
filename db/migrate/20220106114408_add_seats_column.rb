class AddSeatsColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :state, :string
    add_column :seats, :area, :string
    add_column :seats, :user_id, :string
  end
end
