Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects, :tags
  resources :users, only: [:create]
  resources :tickets do
    resources :comments, only: [:create, :edit, :update]
  end

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
