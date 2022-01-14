class CartItemsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :get_cart, except: [:index, :update, :destroy]
  before_action :get_cart_item, only: [:destroy]

  def index
    @buy_now_items = current_user.buy_now_cart_items
    @total_price = current_user.buy_now_cart.total_price
  end

  def create
    ticket = Ticket.find(params[:ticket_id])
    if !ticket
      redirect_to ticket_path, notice: "新增票失敗"
      return
    end

    CartItem.create(ticket: ticket, quantity: params[:quantity], cart: @cart)
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_permit)
      redirect_to cart_items_path
      return
    else
      redirect_to cart_items_path, notice: "更新失敗"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.present?
      @cart_item.destroy
    end
    redirect_to cart_items_path
  end

  private
  def get_cart
    @cart = current_user.carts.find_by(cart_type: params[:cart_type])
    if !@cart
      redirect_to cart_items_path, notice: "沒有找到 cart"
    end
  end

  def get_cart_item
    @cart_item = CartItem.find(params[:id])
    if !@cart_item || (@cart_item.user != current_user)
      redirect_to cart_items_path, notice: "沒有找到 cart item"
    end
  end

  def cart_item_permit
    params.require(:cart_item).permit(:quantity)
  end

end
