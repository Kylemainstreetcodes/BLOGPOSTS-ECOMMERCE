class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end


  def create
    products_in_cart = CartedProduct.where(is_removed: false, is_purchased: false)

    my_order = Order.new

    if products_in_cart.any? 

      my_order = Order.create

      products_in_cart.update_all(is_purchased: true, order_id: my_order.id)

      flash[:success] = "We've received your order"

      redirect_to "/products"
    else
      flash[:alert] = "You need to add products to your cart"
      redirect_to "/products"
    end
  end

  def show
    @order = Order.find(params[:id])
    # @order_total = 0

    # @order.carted_products.each do |carted_product|
    #   quantity = carted_product.amount
    #   price = carted_product.product.price

    #   total_price = quantity * price
    #   @order_total += total_price
    end
  end

end
