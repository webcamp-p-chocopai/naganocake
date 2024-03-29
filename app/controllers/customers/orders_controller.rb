class Customers::OrdersController < ApplicationController
    before_action :authenticate_customer!
  def index
    @all_orders = current_customer.orders
    @orders =  @all_orders.page(params[:page]).per(10).reverse_order
    @freight = 800
  end

  def show
    @order = Order.find(params[:id])
    @freight = 800
  end

  def new
    @customer = current_customer
    @order = Order.new
    if @customer.cart_items.blank?
      flash[:warning] = "カートの中身がありません"
      redirect_to cart_items_path
    end
  end

  def create
    # ↓注文(orders)テーブルに保存
    @order = current_customer.orders.new(order_params)
    if @order.save
    # ↓注文(cart_items)テーブルにデータを入れる(保存する)記述
    # ↓each文で商品カート(cart_items)をとりだす
      current_customer.cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item_id
        @order_item.purchase_quantity = cart_item.item_qty
        @order_item.texed_purchase_price = cart_item.item.non_taxed_price * 1.1.floor
        @order_item.order_id = @order.id
        @order_item.save!
      end
    end
    #↓注文完了時にカート内のデータを消してthanxページに飛ぶ
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def check
    @cart_items = current_customer.cart_items
    # リロードしてもエラーが出ないじょうたいにしたい
    @order = Order.new
    @freight = 800
    # ↓商品合計
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += ((cart_item.item.non_taxed_price * cart_item.item_qty) * 1.1).floor
    end
    # ↓newページのラジオボタンで自身の住所を選択したとき
    if params[:order][:address_op] == "1"
      @order.postal_code = current_customer.cust_postal_code
      @order.dear_address = current_customer.cust_address
      @order.dear_name = current_customer.last_name + current_customer.first_name
      #                  ↑customer_full_name(current_customer)でも可？
    # ↓登録住所から選択したとき
    elsif params[:order][:address_op] == "2"
      # ↓配送先住所のidを特定する
      @address = Address.find(params[:order][:address].to_i)
      # ↓特定したidをもとにそれぞれ呼び出し
      @order.postal_code = @address.postal_code
      @order.dear_address = @address.address
      @order.dear_name = @address.dear_name
    # ↓新しいお届け先を選択したとき
    else  # (params[:order][:address_op] == "3"のとき)
      @address = Address.new()
      # ↓newページで入力した新しいお届け先のデータを入れる(配送先追加)
      @address.postal_code = params[:order][:new_postal_code]
      @address.address = params[:order][:new_address]
      @address.dear_name = params[:order][:new_dear_name]
      @address.customer_id = current_customer.id
      if @address.save
      # ↓注文テーブルにデータを入れる記述(上に記述したデータ流用)
        @order.postal_code = @address.postal_code
        @order.dear_address = @address.address
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
    params.require(:order).permit(:customer_id, :postal_code, :dear_address, :dear_name, :freight, :method_of_payment, :taxed_billing_price, :orderd_status, :address)
  end

  def address_params
    params.permit(:customer_id, :postal_code, :address, :dear_name)
  end


end
