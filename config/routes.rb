Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#index'
  post '/', to: 'sessions#create'
  
  resources :sessions, only: [:create, :index, :new ]
  delete 'logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :opinions, only: [:create, :index, :destroy] do
    resources :likes, only: %i[create destroy]
  end
  resources :comments, only: [:create, :new] 
  resources :followings, only: [:create, :destroy]
end
