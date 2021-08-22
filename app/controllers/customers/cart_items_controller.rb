class Customers::CartItemsController < ApplicationController
    before_action :setup_cart_item!, only: [:edit, :destroy, :update]
    def index
        @cart_items = current_customer.cart_items
        @customer = current_customer
    end
      
    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        p "====================="
        p @cart_item
        p "====================="
        @cart_item.save
        redirect_to cart_items_path
    end
    
    
    def destroy
        cart_item = CartItem.find(params[:id]) 
        cart_item.destroy
        redirect_to cart_items_path
    end
    
    def all_destroy
        current_customer.cart_items.destroy_all
        redirect_to cart_items_path
    end
    
    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
      
    private
    
    def setup_cart_item!
        @cart_item = current_customer.cart_items.find_by(id: params[:id])
    end
    
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :customer_id, :item_qty)

    end
end
