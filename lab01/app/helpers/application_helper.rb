module ApplicationHelper
  def new_blog_active?
    ['new'].index(params[:action]).present?
  end
  def user_blog_active?
        ['userblog'].index(params[:action]).present?
  end
end
