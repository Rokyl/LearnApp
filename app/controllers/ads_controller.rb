class AdsController < ApplicationController
  def index
    @ads = Ad.paginate(page: params[:page])
  end

end
