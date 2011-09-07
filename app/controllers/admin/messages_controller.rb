class Admin::MessagesController < ApplicationController
  before_filter :user_authorize
  
  def get_messages
    messages = Message.board.offset(params[:start].to_i).limit(params[:limit].to_i)
    render :text => get_json(Message.count,messages.to_json),:layout => false
  end

  def get_messages_with_blog
    messages = Message.where('blog_id = ?',params[:blog_id] || 0).order('created_at DESC').offset(params[:start].to_i).limit(params[:limit].to_i)
    render :text => get_json(Message.count,messages.to_json),:layout => false
  end

  def create
    message = Message.new(params[:message])
    result = get_result(message.save ? 'success' : '保存出错，请重新操作')
    render :text => result,:layout => false
  end

  def update
    message = Message.find params[:id]
    if message.update_attributes(params[:message])
      result = 'success'
    else
      result = '更新出错，请重新操作'
    end
    render :text => get_result(result),:layout => false
  end

  def edit
    begin
      render :text => Message.find(params[:id]).to_json,:layout => false
    rescue ActiveRecord::RecordNotFound
      logger.error '请求不存在的文章'
    end
  end

  def destroy_list
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Message.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info),:layout => false
  end
end
