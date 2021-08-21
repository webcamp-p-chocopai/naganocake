class Customers::OrdersController < ApplicationController
def index
  @orders = Order.all
  @freight = 800
end

def show
  @order = Order.find(params[:id])
  @order_items = @oreder.order_items
  @freight = 800
end
end

