Rails.application.routes.draw do
  root to: 'home#index'
  resources :media_points
  resources :products
  resources :media_point_products
end
