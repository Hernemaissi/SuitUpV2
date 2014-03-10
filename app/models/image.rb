# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  url            :string(255)
#  title          :text
#  created_at     :datetime
#  updated_at     :datetime
#  image_album_id :integer
#  image          :string(255)
#

class Image < ActiveRecord::Base
  belongs_to :image_album

  mount_uploader :image, ImageUploader
  validates :image_album_id, presence: true
end
