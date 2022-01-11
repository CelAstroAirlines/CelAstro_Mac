class ChangeSeatsUserIdColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :seats, :user_id, :string
  end
end
