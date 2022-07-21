# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :comments, class_name: 'PostComment', dependent: :destroy
end
