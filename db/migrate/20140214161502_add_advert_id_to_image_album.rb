class AddAdvertIdToImageAlbum < ActiveRecord::Migration
  def change
    add_column :image_albums, :advert_id, :integer
  end
end
