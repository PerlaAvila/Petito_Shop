class Cart < ApplicationRecord
  belongs_to :user
  has_many :products_in_carts
  has_many :products, :through => :products_in_carts

  
end
