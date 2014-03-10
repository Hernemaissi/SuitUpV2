class AddImageAlbumIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_album_id, :integer
  end
end
