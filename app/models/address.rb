class Address < ApplicationRecord
  attr_accessor :full_name, :country, :zip, :state, :city, :province, :street, :number, :int, :tel
  belongs_to :user
end
