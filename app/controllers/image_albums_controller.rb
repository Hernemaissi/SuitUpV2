class ImageAlbumsController < ApplicationController
  def new
  end

  def index
  end

  def show
    @album = ImageAlbum.find(params[:id])
  end
end
