Rails.application.routes.draw do
  get 'sessions/new'
  resources :recipes
  resources :items
  resources :lists
  resources :users

  resources :sessions, only: [:create]
  delete '/sessions', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
end
