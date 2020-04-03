# frozen_string_literal: true

Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  get 'products/update'
  get 'products/delete'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'products#index'
end
