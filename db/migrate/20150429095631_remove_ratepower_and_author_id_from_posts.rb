class RemoveRatepowerAndAuthorIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :ratepower, :string
    remove_column :posts, :author_id, :string
  end
end
