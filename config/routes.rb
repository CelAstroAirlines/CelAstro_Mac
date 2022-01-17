Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root "pages#index"
  get "/experience", to: "pages#experience"
  get "/support", to: "pages#support"
  get "/ready", to: "pages#ready"
  get "/about", to: "pages#about"
  resources :tickets do
    collection do
      get :search   # GET /tickets/search
    end
  end

  resources :seats do
    member do
      get :confirm
      post :check
      post :finished
    end
   end
  
  resources :orders do
    collection do
      post :create
      post :refund
      get :payment
    end
    member do
      post :receivempg
    end
  end

  resources :receipts
  resources :members

  resources :cart_items, only: [:index, :update, :create, :destroy]
  
end
  