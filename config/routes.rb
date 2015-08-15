Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "signup" => "users#new"
  resources :words, only: [:index]
  resources :users
  resources :categories
end
