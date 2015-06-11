class AddAuthorIdAndPlaceIdAndSummitToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :string
    add_column :posts, :place_id, :string
    add_column :posts, :summit, :string
  end
end
