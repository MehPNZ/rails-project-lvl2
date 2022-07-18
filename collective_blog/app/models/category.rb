class Category < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  scope :category_find, -> (post_id) {find_by(id: post_id).name}
end
