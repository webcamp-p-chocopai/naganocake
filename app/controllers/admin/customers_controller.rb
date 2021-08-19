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
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to edit_admin_customer_path(@customer.id)
  end

end
