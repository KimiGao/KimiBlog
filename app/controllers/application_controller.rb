class ApplicationController < ActionController::Base
  protect_from_forgery


  def get_recent_posts
    @posts = Blog.all(:select => "id,title",:limit => 10,:order => "updated_at DESC")
  end

  def validate_user
    unless Admin.find_by_id session[:admin_id]
      flash[:notice] = "请登录"
      redirect_to "/admins/login"
    end
  end
end
