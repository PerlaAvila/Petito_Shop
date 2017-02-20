module ProductsInCartsHelper

  def find_or_create_cart
    if logged_in?
      current_user.cart?
    else
      if session[:cart_id]
        Cart.find(session[:cart_id])
      else 
        cart = Cart.create(user_id: 1)
        session[:cart_id] = cart.id
        cart
      end
    end
  end

end
