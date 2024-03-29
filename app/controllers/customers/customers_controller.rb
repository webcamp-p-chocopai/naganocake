class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def check
  end

  def hide
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :cust_postal_code, :cust_address, :phone_number, :is_deleted )
  end

end
