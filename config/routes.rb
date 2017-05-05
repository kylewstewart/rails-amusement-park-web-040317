Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:new, :edit, :create, :index, :show]
  # resources :sessions

  resources :attractions, :rides

  get '/signin', to: 'sessions#new', as: 'signin'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
