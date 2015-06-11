class Post < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  mount_uploader :img1, ImageUploader
  validates :img1, :title, :presence => true
end
