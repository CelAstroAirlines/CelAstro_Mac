class AddTelToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Tel, :string
  end
end
