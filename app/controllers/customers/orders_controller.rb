class Customers::OrdersController < ApplicationController

  def index
  end

  def show
  end







  def new
    @customer = current_customer

    @order = Order.new

  end

  def create
  end

  def check
    @item_image = current_customer.cart_items
    @order = Order.find(params[:id])

  end

  def thanks
    cart_items = current_customer.cart_items
    cart_items.destroy_all
  end

  private

  def order_new?
    redirect_to cart_items_path, notice: "カートに商品を入れてください。" if current_cutomer.cart_items.blank?
  end

  def request_post?
    redirect_to new_order_path, notice: "もう一度最初から入力してください。" unless request.post?
  end

  def order_params
    params.require(:order).permit(:method_of_payment, :address, :postal_code, :dear_name, :taxed_billing_price)
  end

  def address_params
    params.permit(:address, :dear_name, :postal_code, :customer_id)
  end


end
