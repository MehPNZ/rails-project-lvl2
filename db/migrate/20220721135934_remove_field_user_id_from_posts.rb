class RemoveFieldUserIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :user_id, :integer
  end
end
