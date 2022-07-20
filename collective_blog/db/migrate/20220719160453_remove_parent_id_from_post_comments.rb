class RemoveParentIdFromPostComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_comments, :parent_id, :integer
  end
end
