class RegisteredPet < ApplicationRecord
  has_one :collar
  belongs_to :user

end
