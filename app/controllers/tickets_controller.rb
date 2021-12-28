class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end 

  def new
    @ticket = Ticket.new
  end

  def search
    @ticket = Ticket.new
  end

  def create
     @ticket = Ticket.new(ticket_params)
     if Ticket.find_by(params[:ticket_id]) != @ticket.ticket_id
       @ticket.update
     else
       @ticket.save    
     end
  end

  def search
    @tickets = Ticket.all
    @tickets = @tickets.where(["departure LIKE ?","%#{departure}%"]) if departure.present?
    @tickets = @tickets.where(["arrival LIKE ?","%#{arrival}%"]) if arrival.present?
    @tickets = @tickets.where(["departure_date LIKE ?","%#{departure_date}%"]) if departure_date.present?
    return tickets
    # redirect_to @ticket
  end   

  def show
    @ticket = Ticket.find(params[:ticket_id])
  end


  def update
    @ticket.update(ticket_params)
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.delete
  end

  private
  def ticket_params
    params.require(:ticket).permit(:id, :departure, :arrival, :ticket_amount, :departure_date)
  end
end
