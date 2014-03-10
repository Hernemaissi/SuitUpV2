class AdvertsController < ApplicationController
  def new
    @ad = Advert.new
  end

  def create
    
    ad = Advert.new(ad_params)
    ad.company_id = current_user.company.id
    if ad.save
      i = ImageAlbum.create(:advert_id => ad.id)
      i.save!
      Image.create(:image => params[:image], :image_album_id => i.id)
      flash[:success] = "Image created succesfully"
      redirect_to ad
    else
     render new
    end
  end

  def show
    @ad = Advert.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
  end

  private

  def ad_params
    params.require(:advert).permit(:name, :description, :color)
  end

end
