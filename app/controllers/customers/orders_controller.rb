class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!














  def new
    @customer = current_customer

    @order = Order.new

  end

  def create
    # ↓カート内が空の時にホーム画面に飛ばす
    if current_customer.cart_items.blank?
      redirect_to root_path
    end
    
    
    
    
    
    
    cart_items = current_customer.cart_items
    cart_items.destroy_all
  end

  def check
    # ↓カート内が空の時にホーム画面に飛ばす
    if current_customer.cart_items.blank?
      redirect_to root_path
    end
    @cart_items = current_customer.cart_items
    @order = Order.find(params[:id])
    @freight = @order.freight + 800
    # ↓商品合計
    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += cart_item.item.non_taxed_price * cart_item.item_qty * 1.1
    end
    
    # ↓newページで自身の住所を選択したとき
    if params[:order][address] == "1"
      @order.postal_code = current_customer.cust_postal_code
      @order.address = current_customer.address
      @order.dear_name = current_customer.last_name + current_customer.first_name
      
    # ↓登録住所から選択したとき
    elsif params[:order][address] == "2"
      
    # ↓新しいお届け先を選択したとき
    else
      
    end
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
