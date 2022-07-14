class Category < ApplicationRecord
  has_many :post, dependent: :destroy

  scope :category_find, -> (post_id) {find_by(id: post_id).name}
end
