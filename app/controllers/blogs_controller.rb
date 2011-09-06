class BlogsController < ApplicationController
  before_filter :get_recent_posts
  
  def blogs_list
    @blogs = Blog.all
  end

  def index
    @tag = params[:tag]
    @blogs = Blog.where('tag_name like ?','%'+params[:tag].to_s+'%').order('updated_at DESC').paginate(:page => params[:page]||1,:per_page => 50)
  end

  def show
    @blog = Blog.find(params[:id])
    @message = Message.new
  end

  def comment
    @message = Message.new(params[:message])
    if @message.save
      format.html { redirect_to('/blogs/'+@message.blog_id.to_s+'#message_content')}
    else
      format.html { render "/messages/comment"}
    end
  end

  
end
