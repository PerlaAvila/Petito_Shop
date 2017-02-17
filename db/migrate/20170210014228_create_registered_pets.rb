class CreateRegisteredPets < ActiveRecord::Migration[5.0]
  def change
    create_table :registered_pets do |t|
      t.belongs_to :user
      t.boolean :alert, default: false
      t.string :location
      t.string :pet_name
      t.integer :pet_age
      t.string :pet_disease
      t.string :pet_vaccines
      t.text :pet_info
      t.string :owner_name
      t.string :owner_phone
      t.timestamps
    end
  end
end
