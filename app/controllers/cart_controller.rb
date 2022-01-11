class CartController < ApplicationController

  before_action :if_not_login

  # for tickets view
  def add
    current_cart.add_item(params[:id])
    session[Cart::SessionKey] = current_cart.serialize

    redirect_to cart_path, notice: "已加入購物車"
  end

  def show
    # render html: current_cart.items # if items get nil, because ticket not added
  end

  def destroy
    # session[:cart2022] = nil
    session[Cart::SessionKey] = nil
    redirect_to cart_path, notice: "購物車已清空"
  end

  private
  def if_not_login
    if !current_user
      flash[:notice] = "您尚未登入"
      redirect_to root_path
    end
  end
end
