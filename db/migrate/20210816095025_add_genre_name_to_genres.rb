class AddGenreNameToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :genre_name, :string
    change_column :genres, :genre_name, :string, null: false
  end
end
