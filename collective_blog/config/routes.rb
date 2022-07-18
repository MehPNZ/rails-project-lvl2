# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    scope module: 'posts' do
      resources :comments, only: [:create]
    end
  end

  root 'posts#index'
  devise_for :users

  # resources :posts do
  #   scope module: 'posts' do
  #     resources :comments
  #   end
  # end

  # resources :post_comments do
  #   scope module: 'posts' do
  #     resources :comments, shallow: true
  #   end
  # end


end