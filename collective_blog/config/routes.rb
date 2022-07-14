# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts
  #root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



# resources :answers, only: [] do
#   scope module: :answers do
#     resources :comments
#     resources :likes, only: %i[create destroy]
#     resources :comments, only: %i[create update destroy]
#   end
# end
