class SearchesController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    if @search.save 
      redirect_to @search
    else
      render :new
    end
    
  end

  def show
    @search = Search.find(params[:id])
  end


  private
  def search_params
    params.require(:search).permit(:id, :departure, :arrival, :departure_date)
  end
end
