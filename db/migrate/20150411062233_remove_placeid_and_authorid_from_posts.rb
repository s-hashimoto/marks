class RemovePlaceidAndAuthoridFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :placeid, :string
    remove_column :posts, :authorid, :string
  end
end
