class Admin::BlogsController < ApplicationController
  before_filter :user_authorize
  
  def get_blogs
    blogs = Blog.order('created_at DESC').offset(params[:start].to_i).limit(params[:limit].to_i)
    render :text => get_json(Blog.count,blogs.to_json(:except => [:content])),:layout => false
  end

  def create
    blog = Blog.new(params[:blog])
    if blog.save
      result = 'success'
      create_tag params[:blog][:tag_name]

      #expire_page :controller => :blogs,:action => :index
    else
      result = '保存出错，请重新操作'
    end
    render :text => get_result(result),:layout => false
  end

  def update
    blog = Blog.find params[:id]
    if blog.update_attributes(params[:blog])
      result = 'success'
      create_tag params[:blog][:tag_name]

#      expire_page :controller => :blogs,:action => :index
#      expire_page :controller => :blogs,:action => :show, :id => params[:id]
    else
      result = '更新出错，请重新操作'
    end
    render :text => get_result(result),:layout => false
  end

  def edit
    begin
      render :text => Blog.find(params[:id]).to_json,:layout => false
    rescue ActiveRecord::RecordNotFound
      logger.error '请求不存在的文章'
    end
  end

  def destroy_list
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Blog.destroy(ids)
      info = 'success'

#      ids.each do |id|
#        expire_page :controller => :blogs,:action => :show, :id => id
#      end
#      expire_page :controller => :blogs, :action => :index
#      expire_page :controller => :home, :action => :index
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info),:layout => false
  end

  def get_tags
    tags = Tag.offset(params[:start].to_i).limit(params[:limit].to_i)
    render :text => get_json(Tag.count,tags.to_json),:layout => false
  end

  def destroy_tags
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Tag.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info),:layout => false
  end


  private

  #创建tag
  def create_tag tag_names
    tags = tag_names.split(",")
    tags.each do |tag|
      Tag.create(:tag_name => tag) unless Tag.find_by_tag_name(tag)
    end
  end

end
