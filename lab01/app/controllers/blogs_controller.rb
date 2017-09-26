class BlogsController < ApplicationController
  def index
  end

  def new

  end
  def create
  end
  private
  def blog_params
    params.require(:blog).permit(:title,:content,:status)
  end
end
