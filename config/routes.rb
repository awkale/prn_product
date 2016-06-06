Rails.application.routes.draw do
  root to: 'home#index'
  resources :media_points
  resources :products
  resources :channels
  resources :recipients
  resources :media_point_products
  resources :distributions
  resources :categories
  get '/listing' => "listing#index"
  devise_for :admins
  devise_for :users
  resources :users
end
