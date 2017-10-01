class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:destroy,:update]
  before_action :set_album, only: [:show,:add_image]
  def index
    @albums = Album.all
  end
  def show
    @images = @album.images
    @album.views += 1
    @album.save
  end
  def new
  end
  def create
    p album_params.inspect
    album = Album.new(album_params)
    album.user_id = current_user.id
    if album.save
      redirect_to album
    end
  end
  def add_image
    image = Image.new(image_params)
    image.album_id = @album.id
    if image.save
      redirect_to @album
    end
  end
  private
  def set_album
    @album =  Album.find(params[:id])
  end
  def image_params
    params.require(:image).permit(:avatar)
  end
  def album_params
    params.require(:album).permit(:title,:avatar)
  end
end
