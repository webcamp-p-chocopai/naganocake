class Customers::ItemsController < ApplicationController
  def index
      @genres = Genre.all
<<<<<<< HEAD
      @items = Item.page(params[:page]).per(8)
=======
      @all_items = Item.where(sale_status: true)
      @items = @all_items.page(params[:page]).per(8).reverse_order
>>>>>>> 764a2736ec13f93bb813ca1271875a264e6c2852
  end

  def show
      @item = Item.find(params[:id])
      @genres = Genre.all
      @cart_item = CartItem.new
  end



end
