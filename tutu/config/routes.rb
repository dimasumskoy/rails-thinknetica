Rails.application.routes.draw do
  resources :trains do
    resources :railcars, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :set_time, on: :member
  end
  resources :routes
  resource :search, only: [:new, :show, :edit] do
    get :find_route_trains, on: :collection
    get :show_route_trains
  end
  resources :users
  resources :tickets

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
