# frozen_string_literal: true

Rails.application.routes.draw do
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
  get 'contact', to: 'contacts#show', as: 'contact'
  get 'about', to: 'about#show', as: 'about'
end
