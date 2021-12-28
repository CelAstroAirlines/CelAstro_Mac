class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :departure
      t.string :arrival
      t.string :departure_date

      t.timestamps
    end
  end
end
