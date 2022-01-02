module CartsHelper
  def current_cart
    @cart ||= Cart.from_hash(session[:cart2022])
  end
end
