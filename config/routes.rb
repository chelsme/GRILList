Rails.application.routes.draw do
  resources :recipes
  resources :items
  resources :lists
  resources :users
 end
