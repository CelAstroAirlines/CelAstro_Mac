class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end 

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket Info Updated"
    else 
      flash[:alert] = "Record not found"
      redirect_to root
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
