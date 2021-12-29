class AdsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :correct_user, only: :destroy
  def new
    @ad = Ad.new
    # @photos = @ad.photos.build
  end

  def index
    @ads = Ad.paginate(page: params[:page])
  end

  def create
    @ad = current_user.ads.create(ad_params)
    if @ad.valid?
      redirect_to ad_path(@ad)
    else
      flash[:errors] = @ad.errors
      redirect_to new_ad_path(@ad)
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update(ad_params)
      flash[:success] = "Ad successfully published"
      redirect_to @ad
    else
      render 'edit'
    end
  end

  def destroy
    @ad.destroy
    flash[:success] = "Ads deleted"
    redirect_to request.referer || root_url
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :content, {pictures: []}, :status, :type)
  end

  def correct_user
    @ad = current_user.ads.find(params[:id])
    redirect_to root_url if @ad.nil?
  end

end
