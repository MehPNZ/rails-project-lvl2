# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/(:locale)', locale: /en|ru/ do
    resources :posts do
      scope module: 'posts' do
        resources :comments, shallow: true
      end
    end

    resources :posts do
      scope module: 'posts' do
        resources :likes, only: %i[create destroy]
      end
    end

    root 'posts#index'
    devise_for :users
  end
end
