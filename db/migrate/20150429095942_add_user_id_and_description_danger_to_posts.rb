class AddUserIdAndDescriptionDangerToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :string
    add_column :posts, :description_danger, :string
  end
end
