class Customers::CartItemsController < ApplicationController
    before_action :setup_cart_item!, only: [:edit, :destroy]
    def index
        @cart_items = current_customer.cart_items
    end
      
    def create
        #if @cart_item.blank?
           #@cart_item = current_cart.cart_items.build(product_id: params[:product_id])
        #end
        
           #@cart_item.quantity += params[:quantity].to_i
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        p "====================="
        p @cart_item
        p "====================="
        @cart_item.save
        redirect_to ''
    end
    
    def edit
        @cart_item.update(quantity: params[:quantity].to_i)
        redirect_to ''
    end
    
    def destroy
        @cart_item.destroy
        redirect_to ''
    end
      
    private
    
    def setup_cart_item!
        @cart_item = current_customer.cart_items.find_by(id: params[:id])
    end
    
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :customer_id, :item_qty)

    end
end
