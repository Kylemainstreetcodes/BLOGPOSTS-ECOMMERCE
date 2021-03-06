class Order < ApplicationRecord
  has_many :carted_products

end

def total
  order_total = 0

      self.order = Order.find(params[:id])
      @order_total = 0

      carted_products.each do |carted_product|
      quantity = carted_product.amount
      price = carted_product.product.price

      total_price = quantity * price
      @order_total += total_price
    end
end
