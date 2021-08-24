class Customers::AddressesController < ApplicationController
   before_action :authenticate_customer!
   
  def index 
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save!
    redirect_to addresses_path
  end
 
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
		@address.update(address_params)
		redirect_to addresses_path
  end
  
  def destroy
    @address = Address.find(params[:id])
	  @address.destroy
    redirect_back(fallback_location: root_path)
  end 	
   	
  private
	def address_params
		params.require(:address).permit(:postal_code, :address, :dear_name)
	end
end
