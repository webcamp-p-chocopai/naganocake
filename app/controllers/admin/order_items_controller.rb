class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    order_items = order_item.order.order_items
    # 製作ステータスが一つでも"製作中"になったら、注文ステータスが"製作中"に自動更新
    if order_item.production_status == "製作中"
      order_item.order.update(orderd_status: "製作中")
    # 製作ステータスが全部"製作完了"になったら、注文ステータスが"発送準備中"に自動更新
    elsif order_items.all? {|order_item| order_item.production_status == "製作完了" }
      order_item.order.update(orderd_status: "発送準備中")
    end
    redirect_back(fallback_location: admin_root_path)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end

end
