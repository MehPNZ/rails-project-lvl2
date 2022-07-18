class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  has_many :post_comments, foreign_key: :parent_id

  validates :content, presence: true
end
