class ImagesController < ApplicationController
  def show
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end
end
