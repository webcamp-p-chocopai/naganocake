class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!














  def new
    @customer = current_customer
    @order = Order.new
  end

  def create
    # ↓カート内が空の時にホーム画面に飛ばす(機能するかわからないのでコメントアウト)
    #if current_customer.cart_items.blank?
    #  redirect_to root_path
    #end
    @order = current_customer.orders.new(order_params)
    @cart_items = current_cart_items
    @order.save
    # ↓もし新しいお届け先を入力したときに、配送先テーブルに追加登録する
    if params[:order][address] == "3"
      current_customer.addresses.create(address_params)
    end
    # ↓注文(cart_items)テーブルにデータを入れる記述
    # ↓each文でカラムをとりだして格納？
    @cart_items.each do



    #↓注文完了時にカート内のアイテムデータを消す
    cart_items = current_customer.cart_items
    cart_items.destroy_all
  end


  def check
    # ↓カート内が空の時にホーム画面に飛ばす(機能するかわからないのでコメントアウト)
    #if current_customer.cart_items.blank?
    #  redirect_to root_path
    #end
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @freight = @order.freight + 800
    # ↓商品合計
    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += cart_item.item.non_taxed_price * cart_item.item_qty * 1.1
    end
    # ↓newページのラジオボタンで自身の住所を選択したとき
    if params[:order][address] == "1"
      @order.postal_code = current_customer.cust_postal_code
      @order.address = current_customer.address
      @order.dear_name = current_customer.last_name + current_customer.first_name
      #                  ↑customer_full_name(current_customer)でも可？
    # ↓登録住所から選択したとき
    elsif params[:order][address] == "2"
      order_id = current_customer.addresses.find_by
      @order.postal_code = order_id.
      @order.address = order_id.
      @order.dear_name = order_id.
    # ↓新しいお届け先を選択したとき(不要かも？)
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.dear_name = params[:order][:dear_name]
    end
　end


  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :dear_name, :freight, :method_of_payment, :taxed_billing_price, :orderd_status)
  end

  def address_params
    params.permit(:customer_id, :postal_code, :address, :dear_name)
  end


end
