class RemoveUserIdAndDescriptionDangerFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :User_id, :string
    remove_column :posts, :Descriotion_danger, :string
  end
end
