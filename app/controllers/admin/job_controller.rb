class Admin::JobController < ApplicationController
  before_filter :user_authorize

  def get_jobs
    jobs = Job.all
    render :text => get_json(Job.count,jobs.to_json),:layout => false
  end

  def create
    job = Job.new(params[:job])
    if job.save
      result = 'success'
      #创建成功即可发送简历
      JobMailer.job_email(job).deliver
    else
      result = job.errors.to_s
    end
    result = get_result(job.save ? 'success' : job.errors.to_s)
    render :text => result,:layout => false
  end

  def update
    job = Job.find params[:id]
    if job.update_attributes(params[:job])
      result = 'success'
    else
      result = '更新出错，请重新操作'
    end
    render :text => get_result(result),:layout => false
  end

  def edit
    begin
      render :text => Job.find(params[:id]).to_json,:layout => false
    rescue ActiveRecord::RecordNotFound
      logger.error '请求不存在的job'
    end
  end

  def destroy_list
    begin
      ids = params[:id][1..params[:id].length-2].split(',')
      Job.destroy(ids)
      info = 'success'
    rescue Exception => e
      logger.error e.to_s
      info = "删除异常"
    end
    render :text => get_result(info),:layout => false
  end
end
