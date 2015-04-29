Rails.application.routes.draw do

  get 'reviews/new'

  get 'reviews/create'

  root "movies#index"
  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admins do
    resources :users
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
