module ApplicationHelper
  def new_blog_active?
    if ['new'].index(params[:action]).present?  && ['blogs'].index(params[:controller]).present?
      true
    else
      false
    end
  end
  def user_blog_active?
        ['userblog'].index(params[:action]).present?
  end
  def new_album_active?
    if ['new'].index(params[:action]).present?  && ['albums'].index(params[:controller]).present?
      true
    else
      false
    end
  end

  def albums_active?
    if ['index'].index(params[:action]).present?  && ['albums'].index(params[:controller]).present?
      true
    else
      false
    end
  end

  def about_active?
    ['about'].index(params[:controller]).present?
  end
end
