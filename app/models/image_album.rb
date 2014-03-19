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
  has_many :images, :dependent => :destroy
  belongs_to :advert

  validates :advert_id, presence: true

  def upload_images(images)
    images.each_value do |img|
      if img
        image = Image.create(:image_album_id => self.id)
        image.update_attribute(:image, img)
      end
    end
  end

end
