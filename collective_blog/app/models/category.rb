# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
