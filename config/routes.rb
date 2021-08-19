Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  scope module: :customers do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'

    resource :customers, only: [:show, :edit, :update]
    get '/customers/check' => "customers#check", as: 'customers_check'
    put "/customers/hide" => "customers#hide", as: 'customers_hide'

    resources :items, only: [:show, :index]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:create, :index, :edit, :update, :destroy]
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'

    resources :orders, only: [:index, :show, :new, :create]
    post '/orders/check' => "orders#check", as: 'orders_check'
    get '/orders/thanks' => "orders#thanks", as: 'orders_thanks'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
     resources :order_items, only: [:update]
    end
  end
end
