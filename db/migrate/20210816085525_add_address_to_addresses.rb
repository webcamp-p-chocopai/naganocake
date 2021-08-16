class AddAddressToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address, :string
    add_column :addresses, :customer_id, :integer
    add_column :addresses, :postal_code, :string
    add_column :addresses, :dear_name, :string
    change_column :addresses, :address, :string, null: false
    change_column :addresses, :customer_id, :integer, null: false
    change_column :addresses, :postal_code, :string, null: false
    change_column :addresses, :dear_name, :string , null: false
  end
end
