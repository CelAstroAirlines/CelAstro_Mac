class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :order_timestamp
      t.string :slug
      t.integer :sellign_amount

      t.timestamps
    end
  end
end
