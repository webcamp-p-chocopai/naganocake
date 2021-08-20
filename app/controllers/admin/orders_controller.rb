class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
    #商品合計の変数かく
  end

  def update
    order = Order.find(params[:id])
    order_items = order.order_items
    order.update(order_params)
    if order.orderd_status == "入金確認"
      order_items.all_update(production_status: "製作待ち")
    end
    redirect_to admin_order_path(order.id)
  end

  private
  def order_params
    params.require(:order).permit(:orderd_status)
  end
end
