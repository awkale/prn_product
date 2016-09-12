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
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
end
