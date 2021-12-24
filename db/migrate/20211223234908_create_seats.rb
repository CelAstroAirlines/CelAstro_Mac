class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.string :plane_id

      t.timestamps
    end
  end
end
