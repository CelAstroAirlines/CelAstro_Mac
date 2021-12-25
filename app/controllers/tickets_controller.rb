class TicketsController < ApplicationController
  def index
    @q = Ticket.ransack(params[:q])
    @tickets = @q.result(distinct: true)
  end 

  def new
    @ticket = Ticket.new
  end

  def create
     @ticket = Ticket.new(ticket_params)
     if Ticket.find_by(params[:ticket_id]) != @ticket.ticket_id
       @ticket.update
     else
       @ticket.update     
     end
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
