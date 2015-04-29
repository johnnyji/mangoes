Rails.application.routes.draw do

  root "movies#index"
  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users, except: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  match "movies/search", to: "movies#search", as: "movies_search", via: :get
  match "admin/preview_user/:id", to: "admin/users#preview_user", as: "admin_preview_user", via: :get
  match "admin/back_as_admin", to: "admin/users#back_as_admin", as: "back_as_admin", via: :get
end
