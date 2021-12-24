class AddColumn < ActiveRecord::Migration[6.1]
  def change
    change_table :seats do |t|
      50.times do |i|
        t.boolean :"seat_no#{i}"
      end
    end
  end
end
