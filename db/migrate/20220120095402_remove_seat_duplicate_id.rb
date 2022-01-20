class RemoveSeatDuplicateId < ActiveRecord::Migration[6.1]
  def change
    50.times do |i|
      remove_column :seats, :"seat_no#{i}"
    end
  end
end
