class AddItemNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_name, :string
    add_column :items, :genres_id, :integer
    add_column :items, :item_image_id, :string
    add_column :items, :item_explanation, :text
    add_column :items, :sale_status, :boolean
    add_column :items, :non_taxed_price, :integer

    change_column :items, :item_name, :string, null: false
    change_column :items, :genres_id, :integer, null: false
    change_column :items, :item_image_id, :string, null: false
    change_column :items, :item_explanation, :text, null: false
    change_column :items, :sale_status, :boolean, null: false
    change_column :items, :non_taxed_price, :integer, null: false
  end
end
