Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#index"
  get 'index', to:'pages#index'

  get "/payment", to: "orders#payment"
  # post "/receipt",  to: "orders#receipt"

  # google map
  resources :maps, only: [:index]
  resources :tickets, only: [:index]


  namespace :api do
    namespace :v1 do
      resources :tickets, only: [] do
        member do 
          resources  :seats
        end
      end
    end
  end


  resources :receipts

end
