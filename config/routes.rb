Rails.application.routes.draw do
  resources :recipes
  resources :items
  resources :lists
  resources :users
 
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
end
