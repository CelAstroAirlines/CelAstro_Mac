class TicketsController < ApplicationController
  def index
    # @tickets = Ticket.all
    redirect_to ticket_path(@ticket)
  end 

  def new
    @ticket = Ticket.new
    render :show
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
    @ticket = Ticket.find(params[:departure])
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
    params.require(:ticket).permit(:ticket_id, :departure, :arrival, :ticket_amount, :departure_date)
  end
end
