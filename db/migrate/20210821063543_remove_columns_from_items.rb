class RemoveColumnsFromItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :genres_id, :genre_id
  end
end
