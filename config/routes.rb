Rails.application.routes.draw do
  root to: 'home#index'
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end
  resources :products
  resources :channels
  resources :recipients, :concerns => :paginatable
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
