class Admin::CustomersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def index
    @customers = Customer.all.order(:id)
    @customer = Customer.page(params[:page]).per(10)
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
    redirect_to admin_customer_path(@customer)
  end
  
  protected
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :cust_postal_code, :cust_address, :phone_number, :email, :is_deleted)
  end

end
