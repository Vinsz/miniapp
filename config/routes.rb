Rails.application.routes.draw do
  resources :favorites
  resources :tasks
  resources :lists
  devise_for :users
  get "lists/index"
  root "lists#index"

  get "/publicas" => "lists#publicas"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
