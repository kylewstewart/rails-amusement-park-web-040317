Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:new, :edit, :create, :index, :show]


  resources :attractions, :rides
  #
  get '/sessions/login', to: 'sessions#new', as: 'sessions'
  post '/sessions', to: 'sessions#create'
  get '/signin', to: 'sessions#new', as: 'signin'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
