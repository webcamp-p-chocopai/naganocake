class AddCustomerIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :customer_id, :integer
    change_column :orders, :customer_id, :integer, null: false
  end
end
