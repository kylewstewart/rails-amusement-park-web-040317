Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:new, :edit, :create, :index, :show]
  resources :sessions, only: [:new, :create]

  resources :attractions, :rides

  # get '/sessions/login', to: 'sessions#new'
  # post '/sessions', to: 'sessions#login', as: 'sessions'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'

end
