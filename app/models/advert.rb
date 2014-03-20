# == Schema Information
#
# Table name: adverts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  color       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  company_id  :integer
#

class Advert < ActiveRecord::Base
  has_one :image_album, :dependent => :destroy
  belongs_to :company
  is_impressionable
end
