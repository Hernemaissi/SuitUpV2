class AdvertsController < ApplicationController
  impressionist actions: [:show]

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
      Image.create(:image => params[:image], :image_album_id => i.id)
      flash[:success] = "Image created succesfully"
      redirect_to ad
    else
     render new
    end
  end

  def show
    @ad = Advert.find(params[:id])
    @view_count_all = @ad.impressionist_count(:filter=>:all)
    @view_count_sessions = @ad.impressionist_count(:filter=>:session_hash)
    @view_count_unique = @ad.impressionist_count(:filter=>:ip_address)
    @rent_count_all = @ad.impressionist_count(:message=>"rented", :filter=>:all)
    @rent_count_unique = @ad.impressionist_count(:message=>"rented", :filter=>:ip_address)
  end

  def edit
  end

  def update
  end

  def rent
    @ad = Advert.find(params[:id])
    # impressionist(@ad,message:"rented")
    respond_to do |format|
      format.html { redirect_to @ad, :success => "rented" }
      format.js
     end
  end

  def impressions
    @ad = Advert.find(params[:id])
    respond_to do |format|
      # json = {
      #   :view_count_all => @ad.impressionist_count(:filter=>:all),
      #   :view_count_sessions => @ad.impressionist_count(:filter=>:session_hash)
      # }
      data = Array.[]({
        :close => 0,
        :date => "16-Mar-14"
    }, {
        :close => 1,
        :date => "17-Mar-14"
    }, {
        :close => 13,
        :date => "18-Mar-14"
    }, {
        :close => 3,
        :date => "19-Mar-14"
    }, {
        :close => 21,
        :date => "20-Mar-14"
    })
      msg = { :status => "ok", :message => "Success!", :data => data}
      format.json  { render :json => msg.to_json }
    end
  end  

  def json
    response = {:key => "val"}
    response = response.to_json
    render :json => response, :status => 200
  end

  private

  def ad_params
    params.require(:advert).permit(:name, :description, :color)
  end


end
