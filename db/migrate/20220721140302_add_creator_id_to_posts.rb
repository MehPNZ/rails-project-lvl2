class AddCreatorIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :creator_id, :integer, null: false
  end
end
