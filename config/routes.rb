Rails.application.routes.draw do
  
  get 'rankings/index'
  root to: 'toppages#index'
  devise_for :users
  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :books, only: [:index, :show, :create, :new] do
    # collection do
    #   get :search
    # end
  end
  resources :relationships, only: [:create, :destroy]
  resources :rankings, only: [:index]
end
