Rails.application.routes.draw do
  
  get 'rankings/index'
  root to: 'toppages#index'
  devise_for :users
  resources :users do
    member do
      get :followings
      get :followers
      get :read
    end
  end
  
  resources :books, only: [:index, :show, :create, :new, :update, :destroy] do
    member do
      post :add
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :rankings, only: [:index]
end
