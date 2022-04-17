Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations' # signup view -> app/controllers/public/registrations_controller.rb
  }
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations'
  }

  get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,only:[:index,:new,:create,:show,:edit,:update] ,param: :id
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_details,only:[:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
