Rails.application.routes.draw do
  root to: 'home#index'
  resources :products
  resources :channels
  resources :recipients
  resources :distributions
  resources :categories
  resources :subjects
  resources :multimedia
  resources :industries do
    collection do
      get :manage

      # required for Sortable GUI server side actions
      post :rebuild
    end
  end
  get '/listing' => "listing#index"
  devise_for :admins
  devise_for :users
  resources :users
end
