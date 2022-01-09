Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/pbadmin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root "pages#index"
  get 'index', to:'pages#index'
  get "/payment", to: "orders#payment"

  resources :tickets
  get 'search', to:'tickets#search'
  resources :seats
 
  post '/seats/:id/confirm' , to: 'seats#confirm'
  post '/seats/:id/check', to: 'seats#check'
  post '/orders/receivempg', to: 'orders#receivempg'

  resources :receipts
  resources :members

  resources :cart, only: [:show, :destroy] do
    collection do
      post :add, path: 'add/:id' #for ticket 加入購物車按鍵
    end
  end
end
  
