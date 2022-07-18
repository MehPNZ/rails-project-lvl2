class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  #belongs_to :parent, class_name: 'PostComment', optional: true
  has_many :post_comments, foreign_key: :parent_id

  validates :content, presence: true
end
