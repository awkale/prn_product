Rails.application.routes.draw do
  root to: 'home#index'
  resources :products
  resources :channels
  resources :recipients
  resources :distributions
  resources :categories
  resources :subjects
  get '/listing' => "listing#index"
  devise_for :admins
  devise_for :users
  resources :users
end
