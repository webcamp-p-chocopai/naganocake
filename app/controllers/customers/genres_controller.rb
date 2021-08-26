class Customers::GenresController < ApplicationController
  def index
    @genre = Genre.find(params[:id])
    @all_items = Item.where(genre_id: @genre.id)
    @items = @all_items.page(params[:page]).per(8).reverse_order
    @genres = Genre.all
  end
end
