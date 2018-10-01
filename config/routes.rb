Rails.application.routes.draw do
  resources :recipe_items
  resources :list_items
  resources :list_users
  resources :recipes
  resources :items
  resources :lists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
