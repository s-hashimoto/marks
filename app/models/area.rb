class Area < ActiveRecord::Base
  has_many :places
  mount_uploader :img, ImageUploader
  # ここのimgはarea側のカラム名でok
end
