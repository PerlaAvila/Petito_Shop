class AddAddressesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :province, :string
    add_column :users, :street, :string
    add_column :users, :number, :string
  end
end
