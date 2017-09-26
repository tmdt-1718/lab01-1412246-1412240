class HomeController < ApplicationController
  def index
    @blogs = Blog.search(params[:name])
  end
end
