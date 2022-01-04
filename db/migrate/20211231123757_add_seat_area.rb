class AddSeatArea < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :area, :string
  end
end
