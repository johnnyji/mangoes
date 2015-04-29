Rails.application.routes.draw do

  root "movies#index"
  match "admin/preview_user/:id", to: "admin/users#preview_user", as: "admin_preview_user", via: :get
  match "admin/back_as_admin", to: "admin/users#back_as_admin", as: "back_as_admin", via: :get
  
  resources :movies do
    collection do
      get 'search'
    end
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users, except: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]

end
