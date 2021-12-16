class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :Tel, :tel
  end
end
