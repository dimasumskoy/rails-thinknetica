Rails.application.routes.draw do
  resources :trains do
    resources :railcars, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :set_arrival_time, on: :member
    patch :set_departure_time, on: :member
  end
  resources :routes

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
