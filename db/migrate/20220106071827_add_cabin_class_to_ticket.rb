class AddCabinClassToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :cabin_class, :string
  end
end
