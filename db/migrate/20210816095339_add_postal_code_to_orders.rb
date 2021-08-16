class AddPostalCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postal_code, :integer
    add_column :orders, :dear_address, :string
    add_column :orders, :dear_name, :string
    add_column :orders, :method_of_payment, :integer
    add_column :orders, :freight, :integer
    add_column :orders, :taxed_billing_price, :integer
    add_column :orders, :orderd_status, :integer

    change_column :orders, :postal_code, :integer, null: false
    change_column :orders, :dear_address, :string, null: false
    change_column :orders, :dear_name, :string, null: false
    change_column :orders, :method_of_payment, :integer, default: 0, null: false
    change_column :orders, :freight, :integer, null: false
    change_column :orders, :taxed_billing_price, :integer, null: false
    change_column :orders, :orderd_status, :integer, default: 0, null: false
  end
end
