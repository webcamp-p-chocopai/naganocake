class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!














  def new
    @customer = current_customer
    @order = Order.new
  end

  def create
    # ↓カート内が空の時にホーム画面に飛ばす(privateにまとめて記述？)
    #if current_customer.cart_items.blank?
    #  redirect_to root_path
    #end
    # ↓注文(orders)テーブルに保存
    @order = current_customer.orders.new(order_params)
    @order.save
    # ↓注文(cart_items)テーブルにデータを入れる(保存する)記述
    # ↓each文で商品カート(cart_items)をとりだす
    current_customer.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.purchase_quantity = cart_item.item_qty
      @order_item.taxed_purchase_price = (cart_item.item.non_taxed_price.add_tax_price).round# ←だめなら*1.1にもどす
      @order_item.order_id = @order.id
      @order_item.save
    end
    #↓注文完了時にカート内のデータを消してthanxページに飛ぶ
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end


  def check
    # ↓カート内が空の時にホーム画面に飛ばす(まとめて記述できる？)
    #if current_customer.cart_items.blank?
    #  redirect_to root_path
    #end
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @ntax_price = cart_item.item.non_taxed_price
    @freight = 800
    # ↓商品合計
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += @ntax_price * cart_item.item_qty.add_tax_price# ←だめなら*1.1にもどす
    end
    # ↓newページのラジオボタンで自身の住所を選択したとき
    if params[:order][:address_op] == "1"
      @order.postal_code = current_customer.cust_postal_code
      @order.address = current_customer.address
      @order.dear_name = current_customer.first_name + current_customer.last_name
      #                  ↑customer_full_name(current_customer)でも可？
    # ↓登録住所から選択したとき
    elsif params[:order][:address_op] == "2"
      # ↓配送先住所のidを特定する
      @order_id = Address.find(params[:order][:address])
      # ↓特定したidをもとにそれぞれ呼び出し
      @order.postal_code = @order_id.postal_code
      @order.address = @order_id.address
      @order.dear_name = @order_id.dear_name
    # ↓新しいお届け先を選択したとき
    else  # (params[:order][:address_op] == "3"のとき)
      @address = Address.new()
      # ↓newページで入力した新しいお届け先のデータを入れる(配送先追加)
      @address.postal_code = params[:order][:postal_code]
      @address.address = params[:order][:address]
      @address.dear_name = params[:order][:dear_name]
      @address.current_customer_id = current_customer.id
      if @address.save
      # ↓注文テーブルにデータを入れる記述(上に記述したデータ流用)
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.dear_name = @address.dear_name
      else
        render 'new'
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
