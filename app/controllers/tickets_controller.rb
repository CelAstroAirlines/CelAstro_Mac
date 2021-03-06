class TicketsController < ApplicationController
  before_action :find_ticket, only: [:show, :update, :destroy]

  def index
    @q = Ticket.ransack(params[:q])
    @tickets = @q.result(distinct: true)
  end 
  
  def new
  @ticket = Ticket.new
  end
 

  def create
     @ticket = Ticket.new(ticket_params)
  end

  def search
    @q = Ticket.ransack(params[:q])
    @ticket = @q.result.first
    if @q.ticket_type_cont == "roundtrip" && !@q.returning_date_cont
      flash[:alert] = "購買來回票，請輸入回程日期。"
      render :index
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
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

  def find_ticket
     @ticket = Ticket.find(params[:id])
  end
  
end