class CreateNewebpays < ActiveRecord::Migration[6.1]
  def change
    create_table :newebpays do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :timestamp
      t.string :slug
      t.integer :selling_amount

      t.timestamps
    end
  end
end
