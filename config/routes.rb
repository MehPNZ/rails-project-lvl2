# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, only: :create
  end

  root 'posts#index'
  devise_for :users
end
