Rails.application.routes.draw do
  root "landing#index"

  resources :users, only: [:new, :create, :show]
end
