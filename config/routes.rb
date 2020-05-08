Rails.application.routes.draw do
  
  root to: 'toppages#index'
  devise_for :users
  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :books, only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :relationships, only: [:create, :destroy]
end
