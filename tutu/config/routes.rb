Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :trains do
      resources :railcars, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
      patch :set_time, on: :member
    end
    resources :routes
    resources :tickets

    root to: 'resource_managment#index'
  end

  resources :users
  resources :tickets
  resource :search, only: [:show, :create]

  get 'welcome/index'
  root to: 'welcome#index'
end
