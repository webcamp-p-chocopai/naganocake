class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customers_path(resource)
    when Admin
      admin_orders_path
<<<<<<< HEAD
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when Customer
      root_path
    when Admin
      new_admin_session_pay
=======
>>>>>>> c5be88f6cf931a92daf2d06ab74d63ac40962018
    end
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :cust_postal_code, :cust_address, :phone_number, :email])
  end
end
