class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end 

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
  end

  def show
    @ticket = Ticket.find(params[:ticket_id])
  end


  def update
    @ticket.update(ticket_params)
  end

  def destroy
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.delete
  end

  private
  def ticket_params
    params.require(:ticket).permit(:ticket_id, :ticket_amount, :date)
  end
end
