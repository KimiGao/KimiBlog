class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_authorize
    unless session[:admin_id]
      redirect_to('/admin/login')
    end
  end
  
  def get_recent_posts
    @posts = Blog.order('created_at DESC').limit(10)
  end

  def get_result info
    "{success:true,info:\"#{info}\"}"
  end

  def get_json count,json
    "{totalProperty:#{count},root:#{json}}"
  end
end
