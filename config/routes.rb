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
  
  scope module: :public do
    resource :customers,only:[:show,:edit,:update]
    resources :deliveries,only:[:index,:create,:edit,:update,:destroy]
    resources :items,only:[:index,:show,:create]
    resources :cart_items,only:[:index,:update,:destroy,:all_destroy,:create]
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
