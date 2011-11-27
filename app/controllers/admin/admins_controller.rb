class Admin::AdminsController < ApplicationController
  before_filter :user_authorize

  #获取所有admin
  def get_admins
    admins = Admin.all
    render :text => get_json(Admin.count,admins.to_json),:layout => false
  end

  #创建admin
  def create
    admin = Admin.new(params[:admin])
    result = get_result(admin.save ? 'success' : admin.errors.to_s)
    render :text => result,:layout => false
  end

  def update
    admin = Admin.find params[:id]
    if admin.update_attributes(params[:admin])
      result = 'success'
    else
      result = '更新出错，请重新操作'
    end
    render :text => get_result(result),:layout => false
  end

  def edit
    begin
      render :text => Admin.find(params[:id]).to_json,:layout => false
    rescue ActiveRecord::RecordNotFound
      logger.error '请求不存在的文章'
    end
  end

  #批量删除admin
  def destroy_list
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Admin.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info),:layout => false
  end
end
