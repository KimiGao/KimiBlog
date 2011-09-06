class HomeController < ApplicationController
  before_filter :get_recent_posts

  def index
    @blogs = Blog.order('created_at DESC').paginate(:page => params[:page]||1,:per_page => 5)
  end
end
