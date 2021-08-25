class Customers::ItemsController < ApplicationController
  def index
      @genres = Genre.all
      @all_items = Item.where(sale_status: true)
      @items = @all_items.page(params[:page]).per(8).reverse_order
  end

  def show
      @item = Item.find(params[:id])
      @genres = Genre.all
      @cart_item = CartItem.new
  end
end
