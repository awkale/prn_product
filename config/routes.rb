Rails.application.routes.draw do
  root to: 'home#index'
  resources :media_points
  resources :products
  resources :media_point_products
  resources :users
  get '/listing' => "listing#index"
  devise_for :users
end
