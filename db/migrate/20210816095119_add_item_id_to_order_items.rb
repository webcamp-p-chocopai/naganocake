class AddItemIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :item_id, :integer
    add_column :order_items, :order_id, :integer
    add_column :order_items, :production_status, :integer
    add_column :order_items, :purchase_quantity, :integer
    add_column :order_items, :texed_purchase_price, :integer

    change_column :order_items, :item_id, :integer, null: false
    change_column :order_items, :order_id, :integer, null: false
    change_column :order_items, :production_status, :integer, default: 0, null: false
    change_column :order_items, :purchase_quantity, :integer, null: false
    change_column :order_items, :texed_purchase_price, :integer, null: false
  end
end
