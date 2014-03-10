class CreateImageAlbums < ActiveRecord::Migration
  def change
    create_table :image_albums do |t|

      t.timestamps
    end
  end
end
