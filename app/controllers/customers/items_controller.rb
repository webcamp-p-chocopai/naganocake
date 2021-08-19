class Customers::ItemsController < ApplicationController

  def index
    @all_items = Item.all
    @items = @all_items.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end