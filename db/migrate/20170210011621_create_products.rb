class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :products_in_cart, index: true
      t.string :name
      t.decimal :price, precision: 12, scale: 3
      t.string :category
      t.integer :stock
      t.timestamps
    end
  end
end
 