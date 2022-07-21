class AddCreatorToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :creator, :string
  end
end
