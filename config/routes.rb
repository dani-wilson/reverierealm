Rails.application.routes.draw do
  root "landing#index"

  resources :users, only: [:new, :create, :show]

  resources :dreams, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
