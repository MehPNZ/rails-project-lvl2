# frozen_string_literal: true

Rails.application.routes.draw do
  # scope '/(:locale)', locale: /en|ru/ do
  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, shallow: true
  end

  root 'posts#index'
  devise_for :users
  # end
end
