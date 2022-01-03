class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    puts params
    if @tag.save
      redirect_to "/admin/ads"
    else
      flash[:error] = "tag was not created"
    end
  end


  def destroy
    if @tag.ads == nil
      @tag.destroy
    else
      flash[:error] = "There are some ads with this tag"
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:tag)
  end
end
