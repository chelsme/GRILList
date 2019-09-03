Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :recipes
  resources :items
  resources :lists
  resources :users

  resources :sessions, only: [:create]
  get '/sessions', to: 'sessions#new'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/recipes/:id', to: 'recipes#add_to_list', as: 'add_to_list'
  post '/lists/:id', to: 'lists#share', as: 'share_list'

  get '/recipe_search', to: 'recipes#search', as: 'recipe_search'
  get '/list_search', to: 'lists#search', as: 'list_search'
end
