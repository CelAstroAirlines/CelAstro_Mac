class TicketsController < ApplicationController

  def index
    @q = Ticket.ransack(params[:q])
    @tickets = @q.result(distinct: true)
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
    @q = Ticket.ransack(params[:q])
    @ticket = @q.result.first
  end   

  def show
    @ticket = Ticket.find_by(id: params[:id])
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
    params.require(:ticket).permit(:departure, :arrival, :ticket_amount, :departure_date)
  end
  def search_params
    params.require(:ticket).permit(:departure, :arrival, :departure_date)
  end
end
