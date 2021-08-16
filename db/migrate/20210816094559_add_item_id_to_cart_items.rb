class AddItemIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :item_id, :integer
    add_column :cart_items, :customer_id, :integer
    add_column :cart_items, :item_qty, :integer
    change_column :cart_items, :item_id, :integer, null: false
    change_column :cart_items, :customer_id, :integer, null: false
    change_column :cart_items, :item_qty, :integer, null: false
  end
end
