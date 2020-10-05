Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#index'
  # post '/', to: 'admin_sessions#create'
  post '/', to: 'sessions#create'
  # 

  get '/admin_login', to: 'admin_sessions#new'
  post '/admin_login', to: 'admin_sessions#create'
  delete '/admin_logout', to: 'admin_sessions#destroy'
  get '/admin_approve', to: 'admins#approve'
  post "/admin_approve/:id", to: 'admins#update_approval'
  resources :admins, only: [:create, :index, :new]

  
  resources :sessions, only: [:create, :index, :new ]
  delete 'logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :opinions, only: [:create, :index, :destroy, :edit, :update, :show] do
    resources :likes, only: %i[create destroy]
  end
  resources :comments, only: [:create, :new] 
  resources :followings, only: [:create, :destroy]
  get 'projects/new', to: 'projects#new'
  post 'projects/new', to: 'projects#create'
  
end
