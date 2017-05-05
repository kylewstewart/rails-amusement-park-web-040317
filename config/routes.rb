Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:new, :edit, :create, :index, :show]
  # resources :sessions

  resources :attractions, :rides

  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signin', to: 'sessions#new', as: 'signin'
  delete '/logout', to: 'sessions#destroy', as: 'logout_delete'
  post 'login', to: 'sessions#create'

end
