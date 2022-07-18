# frozen_string_literal: true

Rails.application.routes.draw do

  resources :posts do
    scope module: 'posts' do
      resources :comments, only: [:create]
    end
  end

  resources :posts do
    scope module: 'posts' do
      resources :likes, only: %i[create destroy], shallow: true 
    end
  end 

  root 'posts#index'
  devise_for :users

end