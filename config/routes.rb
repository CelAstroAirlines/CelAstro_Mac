Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/pbadmin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root "pages#index"
  get "/experience", to: "pages#experience"
  get "/support", to: "pages#support"
  get "/ready", to: "pages#ready"
  resources :tickets do
    collection do
      get :search   # GET /tickets/search
    end
  end

  resources :seats do
    member do
      post :confirm
      post :check
    end
   end
 
  get '/seats/:id/confirm' , to: 'seats#confirm'
  post '/seats/:id/finished' , to: 'seats#finished'
  post '/seats/:id/check', to: 'seats#check'
  
  resources :orders, only: [] do
    collection do
      get :payment
      post :receivempg
    end
  end

  resources :receipts
  resources :members

  resources :cart_items, only: [:index, :update, :create, :destroy]
  
end
  
