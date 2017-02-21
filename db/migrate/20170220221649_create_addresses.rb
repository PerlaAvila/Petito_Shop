class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :full_name
      t.string :country
      t.string :zip
      t.string :state
      t.string :city
      t.string :province
      t.string :street
      t.string :number
      t.string :int
      t.string :tel  
      t.belongs_to :user, true

      t.timestamps
    end

    
  end
end
