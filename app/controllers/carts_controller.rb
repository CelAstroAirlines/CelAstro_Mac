class CartsController < ApplicationController

  before_action :if_not_login

  # 給 ticket 頁面使用, path: add_carts_path 加入購物車
  def add
    current_cart.add_item(params[:id]) # current_cart 定義在 CartsHelper
    session[:cart2022] = current_cart.serialize

    redirect_to tickets_path, notice: "已加入購物車"
  end

  def index  
    @carts = Cart.all

  end

  def show
    # render html: current_cart.items # 空值,應該是票沒被加入成功的關係
  end

  private
  def if_not_login
    if !current_user
      flash[:notice] = "您尚未登入"
      redirect_to root_path
    end
  end
end
