Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/pbadmin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#index"
  get 'index', to:'pages#index'

  get "/payment", to: "orders#payment"
  # post "/receipt",  to: "orders#receipt"

  # ticket
  resources :tickets
  get 'search', to:'tickets#search'
 
  resources :tickets, only: [:index]
  resources :searches


  namespace :api do
    namespace :v1 do
      resources :tickets, only: [] do
        member do 
          resources  :seats
        end
      end
    end
  end
  post '/api/v1/tickets/:id/seats/update' , to: 'api/v1/seats#update_seat'
  post '/api/v1/tickets/:id/seats/check', to: 'api/v1/seats#check'
  post '/orders/receivempg', to: 'orders#receivempg'
  # post '/receipts/index', to: 'receipts#index


 
  resources :receipts
  resources :members

  # cart
  resources :cart, only: [:show, :destroy] do
    collection do
      post :add, path: 'add/:id' #for ticket 加入購物車按鍵
    end
  end

end
