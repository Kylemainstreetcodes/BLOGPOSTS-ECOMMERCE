class Category < ApplicationRecord
  has_many :products
  has_many :product_categories
  has_many :products, through: :product_categories
end
