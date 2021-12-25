class Search < ApplicationRecord
  def search_ticket
     tickets = Ticket.all
     tickets = ticekts.where(["departure LIKE ?","%#{departure}%"]) if departure.present?
     tickets = ticekts.where(["arrival LIKE ?","%#{arrival}%"]) if arrival.present?
     tickets = ticekts.where(["departure_date LIKE ?","%#{departure_date}%"]) if departure_date.present?

     return tickets
  end     
end
