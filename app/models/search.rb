class Search < ApplicationRecord
  def search_ticket
     tickets = Ticket.all
     tickets = tickets.where(["departure LIKE ?","%#{departure}%"]) if departure.present?
     tickets = tickets.where(["arrival LIKE ?","%#{arrival}%"]) if arrival.present?
     tickets = tickets.where(["departure_date LIKE ?","%#{departure_date}%"]) if departure_date.present?

     return tickets
  end     
end