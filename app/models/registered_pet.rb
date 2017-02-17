class RegisteredPet < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_one :collar
  belongs_to :user
  validates_processing_of :avatar
  validate :avatar_size_validation

  private
  def avatar_size_validation
    errors[:avatar] << "debe ser menor a 900KB" if avatar.size > 0.9.megabytes
  end
 
end
