class CommentController < ApplicationController
  before_action :set_comment, only: [ :destroy]
  def create
    @comment = Comment.new(comment_prams)
    @comment.user_id = current_user.id
    blog =params[:id]
    @comment.blog_id = blog
    @comment.post_date = Time.now
    @comment.save
    redirect_to Blog.find(blog)
  end




  def destroy
    blog = @comment.blog
    @comment.destroy
    redirect_to blog
  end
  def comment_prams
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
