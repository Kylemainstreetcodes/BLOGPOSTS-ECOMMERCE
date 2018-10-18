class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(is_removed: false, is_purchased: false)
    
  end

  def create
    carted_product = CartedProduct.create(product_id: params[:product_id] , amount: params[:amount],
      is_removed: false, is_purchased: false)
    redirect_to("/carted_products")
  end

  def update
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(is_removed: true)

    redirect_to "/carted_products"
  end
 
end
