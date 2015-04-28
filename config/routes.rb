Rails.application.routes.draw do

  root "movies#index"
  resources :movies
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
