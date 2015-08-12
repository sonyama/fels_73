Rails.application.routes.draw do

  root "static_pages#home"

  get "help" => "static_pages#help"
  get "about" => "static_pages#about"

  resources :words
  resources :categories
  resources :lessons

  namespace :admin do
    root "categories#index"
    resources :categories
  end
end
