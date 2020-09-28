Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :favorite
      get :followings
      get :followers
    end
  end

  


  resources :microposts, only: [:create, :destroy] do
    member do
      post  'favorite' => 'favorites#create'
      delete 'favorite' => 'favorites#destroy'
    end
  end




  resources :relationships, only: [:create, :destroy]
end