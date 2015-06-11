class Place < ActiveRecord::Base
  has_many :posts
  mount_uploader :img, ImageUploader
end
