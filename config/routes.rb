Rails.application.routes.draw do


  devise_for :public, controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations'
      }
  
  devise_for :admin, controllers: {
        sessions: 'admin/sessions',
        registrations: 'admin/registrations'
      }

  get '/admin' => 'admin/homes#top'
    namespace :admin do
      resources :genres,only:[:index,:create,:edit,:update]
      resources :items,only:[:index,:new,:create,:show,:edit,:update] 

    end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
