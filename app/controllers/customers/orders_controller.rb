class Customers::OrdersController < ApplicationController
def index
  @orders = Order.all
  #@total_price = @products.sum(:product_price)
end

def show
  @order = Order.find(params[:id])
  @order_items = @oreder.order_items
end
end

