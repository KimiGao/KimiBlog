class JobMailer < ActionMailer::Base
  default :from => "kimigao1986@gmail.com"
  default_url_options[:host] = "kimigao.me"

  def job_email(job)
    @job = job
    mail(:to => job.email,:subject => job.subject)
  end
end
