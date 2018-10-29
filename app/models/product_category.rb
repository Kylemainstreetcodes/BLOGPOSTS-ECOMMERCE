class ProductCategory < ApplicationRecord
  belongs_to :products
  belongs_to :category
  validates :name, length: {minimum:3, maximum: 25}, presence: true
  validates :description, length: {minimum: 3, maximum: 500}, presence: true
end
