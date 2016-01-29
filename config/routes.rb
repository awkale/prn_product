Rails.application.routes.draw do
  root to: 'home#index'
  resources :media_points
  resources :products
  resources :media_point_products
  get '/listing' => "listing#index"
  devise_for :users
  resources :users
end
