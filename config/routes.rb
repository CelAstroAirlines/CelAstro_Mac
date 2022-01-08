Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/pbadmin', as: 'rails_admin'
  devise_for :users

  root "pages#index"
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
 
  resources :orders, only: [] do
    collection do
      get :payment
      post :receivempg
    end
  end

  resources :receipts
  resources :members

  resources :cart, only: [:show, :destroy] do
    collection do
      post :add, path: 'add/:id' #for ticket 加入購物車按鍵
    end
  end
end
  
