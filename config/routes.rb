Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :routes
  resources :railway_stations
  resources :trains
end
