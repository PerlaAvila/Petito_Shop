class AddAvatarToRegisteredPet < ActiveRecord::Migration[5.0]
  def change
    add_column :registered_pets, :avatar, :string
  end
end
