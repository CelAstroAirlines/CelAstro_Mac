class RemoveDateFromTicket < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :date, :datetime
  end
end
