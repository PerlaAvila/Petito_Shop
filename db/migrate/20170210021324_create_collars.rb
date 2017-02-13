class CreateCollars < ActiveRecord::Migration[5.0]
  def change
    create_table :collars do |t|
      t.references :registered_pet, foreign_key: true
      t.integer :price
      t.string :size
      t.string :category
      t.timestamps
    end
  end
end
