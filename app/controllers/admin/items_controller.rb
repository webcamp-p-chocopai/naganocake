class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @item = Item.find(params[:id])
  end

  def index
    @all_items = Item.all
    @items = @all_items.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item)
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_explanation, :non_taxed_price, :sale_status, :genre_id)
  end

end