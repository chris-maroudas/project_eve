class Asset < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, AssetUploader
  has_and_belongs_to_many :users
end
