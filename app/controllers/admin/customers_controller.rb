class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all.order(:id)
    @customer = Customer.page(params[:page]).reverse_order
  end
  
  def show
    @customer = Customer.find(params[:id])
  end 
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    #is_deletedカラムをtrueに変更することにより削除フラグを立てる
    # @customer.update(is_deleted: true)
    # reset_session
    # flash[:notice] = "退会処理を実行いたしました"
    # redirect_to admin_customer_path(@customer)
  end
  
  protected
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :cust_postal_code, :cust_address, :phone_number, :email)
  end

end
