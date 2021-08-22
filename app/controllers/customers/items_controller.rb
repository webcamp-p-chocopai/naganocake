class Customers::ItemsController < ApplicationController
  def index
      @genres = Genre.all
      @items = Item.page(params[:page]).per(8).reverse_order
  end

  def show
      @item = Item.find(params[:id])
      @genres = Genre.all
      @cart_item = CartItem.new
  end
end
