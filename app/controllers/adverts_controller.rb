class AdvertsController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash]

  def index
    @ads = Advert.all
  end

  def new
    @ad = Advert.new
  end

  def create
    
    ad = Advert.new(ad_params)
    ad.company_id = current_user.company.id
    if ad.save
      i = ImageAlbum.create(:advert_id => ad.id)
      i.save!
      i.upload_images(params[:images])
      flash[:success] = "Image created succesfully"
      redirect_to ad
    else
     render new
    end
  end

  def show
    @ad = Advert.find(params[:id])
    @view_count = @ad.impressionist_count(:filter=>:session_hash)
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
