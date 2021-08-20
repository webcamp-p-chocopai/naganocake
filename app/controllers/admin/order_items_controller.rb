class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    case order_item.production_status
      when "製作中"
        order_item.order.update(orderd_status: "製作中")
      when "製作完了"
        if order_item.order.order_items.all?


    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
