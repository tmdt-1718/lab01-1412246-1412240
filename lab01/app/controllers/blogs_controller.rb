class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:new,:edit,:create,:destroy]
  before_action :check_user, only:[:edit]
  def index
  end

  def new
    @blog = Blog.new

  end

  def edit
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    blog.save
  end
  private
  def set_blog
  @blog = Blog.find(params[:id])
  end

  def check_user
    if user_signed_in?
      if @blog.user_id.to_i != current_user.id
          redirect_to root_path
      end
    else
        redirect_to root_path
    end
  end
  def blog_params
    params.require(:blog).permit(:title,:content,:status,:avatar)
  end
end
