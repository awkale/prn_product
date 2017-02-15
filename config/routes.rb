Rails.application.routes.draw do
  root to: 'home#index'
  resources :products
  resources :channels
  resources :recipients
  resources :distributions
  resources :categories
  resources :product_lines do
    collection do
      get :manage
      post :rebuild
    end
  end
  resources :subjects
  resources :multimedia
  resources :tickers
  resources :industries do
    collection do
      get :manage

      # required for Sortable GUI server side actions
      post :rebuild
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  #api
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
      resources :recipients, only: [:index, :show]
    end
  end
end
