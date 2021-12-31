class Admin::AdsController < ApplicationController
  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update(ad_params)
  end

  private

  def ad_params
    params.require(:ad).permit( :status, :type)
  end
end
