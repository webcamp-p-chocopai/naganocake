class Customers::OrdersController < ApplicationController

  def index
  end

  def show
  end
  
  def new
    
  end
  
  def create
  end
  
  def check
    @item_image = current_custmer.cart_items
    @order = Order.find(params[:id])
    
    
  end
  
  def thanks
    cart_items = current_user.cart_items
    cart_items.destroy_all
  end




end
