class HomeController < ApplicationController
  before_filter :get_recent_posts

  #博客首页
  def index
    @blogs = Blog.order('created_at DESC').paginate(:page => params[:page]||1,:per_page => 5)
  end
end
