class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @all_orders = Order.all.order(created_at: :desc)
    @orders = @all_orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
    # 送料
    @freight = 800
    # 商品合計
    @total_price = 0
    @order_items.each do |order_item|
    @total_price += ((order_item.item.non_taxed_price * 1.1) * order_item.purchase_quantity).floor
    end
  end

  def update
    order = Order.find(params[:id])
    order_items = order.order_items
    order.update(order_params)
    # 注文ステータスが"入金確認"になったら、製作ステータス全てを"製作待ち"に自動更新?
    if order.orderd_status == "入金確認"
      order_items.update_all(production_status: "製作待ち")
    end
    redirect_back(fallback_location: admin_root_path)
  end

  private
  def order_params
    params.require(:order).permit(:orderd_status)
  end
end
