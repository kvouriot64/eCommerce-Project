# frozen_string_literal: true

Rails.application.routes.draw do
  get 'registrations/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations' # set route for registrations
  }
  get 'pages/show'
  get 'contacts/show'
  get 'contact/show'
  get 'about/show'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  get 'products/update'
  get 'products/delete'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'products#index'
  get 'products/:id', to: 'products#show', as: 'product' # product_path
  get 'search', to: 'products#search', as: 'search'
  get 'categories/:id', to: 'categories#show', as: 'category'

  # page routes
  resources :page, only: :show
  get '/p/:permalink', to: 'pages#permalink', as: 'permalink'

  # cart
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  post 'products/increment/:id', to: 'products#increment', as: 'increment'
  post 'products/decrement/:id', to: 'products#decrement', as: 'decrement'

  # checkout
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  # user show
  get 'users/profile/:id', to: 'users#show', as: 'profile'
end
