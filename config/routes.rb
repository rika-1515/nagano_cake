Rails.application.routes.draw do



  get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,only:[:index,:new,:create,:show,:edit,:update] ,param: :id
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_details,only:[:update]
  end
  
  root to:'public/homes#top'
  get '/about'=>'public/homes#about'
 
  get '/customers/quit'=>'public/customers#quit'
  patch '/customer/out'=>'public/customers#out',as: 'out_customer'
  put '/customer/out'=>'public/customers#out'
  delete 'cart_items'=>'public/cart_items#all_destroy' ,as: 'all_destroy'
  post 'orders/log'=>'public/orders#log'
  get 'orders/thanx'=>'public/orders#thanx'  
  
  scope module: :public do
    resource :customers,only:[:show,:edit,:update]
    resources :deliveries,only:[:index,:create,:edit,:update,:destroy]
    resources :items,only:[:index,:show,:create]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :orders,only:[:new,:create,:index,:show]
  end
  
  
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations' # signup view -> app/controllers/public/registrations_controller.rb
  }
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations'
  }

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
