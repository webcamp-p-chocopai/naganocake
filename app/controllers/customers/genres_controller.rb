class Customers::GenresController < ApplicationController
  def index
    @all_items = Item.all(sale_status: true)
    @items = @all_items.page(params[:page]).per(8).reverse_order
    @genres = Genre.all
  end

  # indexがidを持っていないので一度経由するためにsearchアクションを作成
  def search
    @genre = Genre.find(params[:id])
    @all_items = Item.where(sale_status: true, genre_id: @genre.id)
    @items = @all_items.page(params[:page]).per(8).reverse_order
    @genres = Genre.all
    # renderでそのままindexにとばす
    render :index
  end
end
