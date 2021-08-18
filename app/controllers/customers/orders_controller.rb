class Customers::OrdersController < ApplicationController

  def index
  end

  def show
  end
  
  def new
    @item_image = current_custmer.cart_items
  end
  
  def create
  end
  
  def check
  end
  
  def thanks
  end




end
