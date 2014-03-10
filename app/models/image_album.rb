# == Schema Information
#
# Table name: image_albums
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  advert_id  :integer
#

class ImageAlbum < ActiveRecord::Base
  has_many :images
  belongs_to :advert

  validates :advert_id, presence: true
end
