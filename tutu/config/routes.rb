Rails.application.routes.draw do
  devise_for :users
  
  resources :trains do
    resources :railcars, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :set_time, on: :member
  end
  resource :search, only: [:show, :create]
  resources :routes
  resources :users
  resources :tickets

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
