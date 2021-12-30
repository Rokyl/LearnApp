class PicturesController < ApplicationController
  before_action :set_ad

  def create
    add_more_pictures(pictures_params[:pictures])
    flash[:error] = "Failed uploading pictures" unless @ad.save
    redirect_back fallback_location: root_path
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @ad.save
    respond_to do |format|

      format.html # edit.html.erb
      format.json { render json: "Deleted successfully!" }

    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:ad_id])
  end

  def add_more_pictures(new_pictures)
    pictures = @ad.pictures
    pictures += new_pictures
    @ad.pictures = pictures
  end

  def remove_image_at_index(index)
    remain_pictures = @ad.pictures
    if index == 0 && @ad.pictures.size == 1
      @ad.remove_pictures!
    else
      deleted_image = remain_pictures.delete_at(index)
      deleted_image.try(:remove!)
      @ad.pictures = remain_pictures
    end
  end

  def pictures_params
    params.require(:ad).permit({pictures: []}) # allow nested params as array
  end
end