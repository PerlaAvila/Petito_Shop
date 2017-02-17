class Product < ApplicationRecord 
  has_many :products_in_carts
  has_many :carts, :through => :products_in_carts
end
