class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customers_path(current_customer.id)
    when Admin
      admin_orders
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when Customer
      root_path
    when Admin
      new_admin_session
    end
  end
  
end
