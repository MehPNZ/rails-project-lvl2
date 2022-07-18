# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts do
    scope module: 'posts' do
      resources :comments, shallow: true, only: [:create, :destroy]
    end
  end

  resources :comments do
    scope module: 'posts' do
      resources :comments, shallow: true, only: [:create, :destroy]
    end
  end


end