class BlogsController < ApplicationController
  before_filter :get_recent_posts

  #获取博客列表
  def index
    @tag = params[:tag]
    @blogs = Blog.where('tag_name like ?','%'+params[:tag].to_s+'%').order('updated_at DESC').paginate(:page => params[:page]||1,:per_page => 50)
  end

  #显示指定blog,创建message对象
  def show
    @blog = Blog.find(params[:id])
    @message = Message.new
  end

  #创建博客留言，成功重定向到博客页面，失败到错误页面
  def comment
    @message = Message.new(params[:message])
    if @message.save
      format.html { redirect_to('/blogs/'+@message.blog_id.to_s+'#message_content')}
    else
      format.html { render "/messages/comment"}
    end
  end

  
end
