class AddStartPointAndEndPointToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :start_point, :string
    add_column :posts, :end_point, :string
  end
end
