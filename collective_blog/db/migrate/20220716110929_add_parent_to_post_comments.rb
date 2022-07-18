class AddParentToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :parent_id, :integer, null: true
  end
end
