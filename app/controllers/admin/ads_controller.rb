class Admin::AdsController < ApplicationController
  def edit
    @ad = Ad.find(params[:id])
    @variant = params[:variant]
    @tags = {}
    Tag.all.each_with_index do |tag, index|
      update_hs = { tag.tag => index+1 }
      @tags.update(update_hs)
    end
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update(status: :published, published_at: DateTime.now, tags_id: params[:ad][:tags_id]) if params[:ad][:status] == "published"
    @ad.update(status: :declined, reason: params[:ad][:reason]) if params[:ad][:status] == "declined"
    redirect_to admin_ads_path
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def index
    @ads = Ad.where(status: :pending).paginate(page: params[:page])
  end

end
