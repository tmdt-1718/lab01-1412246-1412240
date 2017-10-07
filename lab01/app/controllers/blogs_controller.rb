class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:new,:edit,:create,:destroy]
  before_action :check_user, only:[:edit]
  def index
    @blogs = Blog.where(["status ='public'"])
    .order(created_at: :desc)
    .paginate(:page => params[:page],:per_page => 3)
  end

  def new
    @blog = Blog.new
    p params[:action]
    p params[:controller]
 end

  def show
    if (@blog.status == "private" )
      check_user
    else
      increase_view
    end

  end

  def increase_view
    @blog.views += 1
    @blog.save
  end

  def edit
  end
  def destroy
  @blog.destroy
  respond_to do |format|
    format.html { redirect_to user_blog_path, notice: 'Blog was successfully destroyed.' }
    format.json { head :no_content }
  end
end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    respond_to do |format|
          if blog.save
            format.html { redirect_to blog, notice: 'Blog was successfully updated.' }
          else
          redirect_to  new_blog_path
          end
      end
    end
  def update
      respond_to do |format|
    if @blog.update(blog_params)
      format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      format.json { render :show, status: :ok, location: @blog }
    else
      format.html { render :edit }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
  end
  end

  def userblog
    @blogs = current_user.blogs
  end

  private
  def set_blog
  @blog = Blog.find(params[:id])
  end

  def check_user
    if user_signed_in?
      if @blog.user_id != current_user.id
          redirect_to root_path
      else
        increase_view
      end
    else
        redirect_to root_path
    end
  end
  def blog_params
    params.require(:blog).permit(:title,:content,:status,:avatar)
  end
end
