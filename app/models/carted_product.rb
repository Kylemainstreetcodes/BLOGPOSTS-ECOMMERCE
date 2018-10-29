class CartedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true

  validates :amount, presence: true, numericality: {greater_than: 0, only_integer: true}


end
