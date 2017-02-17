class CreateProductsInCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :products_in_carts do |t|
      t.belongs_to :product
      t.belongs_to :cart
      t.integer :total_quantity
      t.timestamps
    end
  end
end
