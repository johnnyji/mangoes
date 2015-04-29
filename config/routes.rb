Rails.application.routes.draw do

  get 'reviews/new'

  get 'reviews/create'

  root "movies#index"
  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users, except: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  match "admin/preview_user/:id", to: "admin/users#preview_user", as: "admin_preview_user", via: :get
  match "admin/back_as_admin", to: "admin/users#back_as_admin", as: "back_as_admin", via: :get
end
