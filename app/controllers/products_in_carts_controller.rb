class ProductsInCartsController < ApplicationController
  def create
    p params
    p @cart = find_or_create_cart
    @product = Product.find(params[:product_id])
    pic = @cart.products_in_carts.find_by_product_id(@product.id)
    pic ?  pic.increment(:total_quantity) : @cart.products_in_carts.create(product_id: @product.id, total_quantity: 1) 
    quantity = @cart.quantity ? @cart.quantity + 1 : 1
    total = @cart.total ? @cart.total + @product.price : @product.price
    @cart.update(total: total, quantity: quantity)
  end
end
