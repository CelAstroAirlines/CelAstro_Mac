Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/pbadmin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root "pages#index"
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
 
  
  resources :orders, only: [] do
    collection do
      post :create
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
  
