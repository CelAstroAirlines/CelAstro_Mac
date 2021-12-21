class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :ticket_amount
      t.string :departure
      t.string :arrival
      t.string :airport
      t.datetime :date
      t.string :seat_no  

      t.timestamps
    end
  end
end
