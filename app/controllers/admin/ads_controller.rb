class Admin::AdsController < ApplicationController
  def edit
    @ad = Ad.find(params[:id])

  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update(status: :published, published_at: DateTime.new, type: params[:type]) if params[:status] == "published"
    @ad.update(status: :declined, reason: params[:reason]) if params[:status] == "declined"
    #redirect_to root_path
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def index
    @ads = Ad.where(status: :pending)

  end


  private

  def ad_params_accepted
    params.permit( :status, :type)
  end

  def ad_params_declined
    params.permit(:status, :reason)
  end
end
