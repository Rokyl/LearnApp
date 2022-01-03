class Admin::AdsController < ApplicationController
  def edit
    @ad = Ad.find(params[:id])
    @variant = params[:variant]
    @tags = []
    Tag.all.each do |tag|
      @tags << tag.tag
    end
  end

  def update
    @ad = Ad.find(params[:id])
    puts params[ad: :status]
    @ad.update(status: :published, published_at: DateTime.new, tag: params[:tag]) if params[:status] == "published"
    @ad.update(status: :declined, reason: params[:reason]) if params[:status] == "declined"
    #redirect_to root_path
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def index
    @ads = Ad.where(status: :pending).paginate(page: params[:page])
  end


  private

  def ad_params_accepted
    params.permit( :status, :tag)
  end

  def ad_params_declined
    params.permit(:status, :reason)
  end
end
