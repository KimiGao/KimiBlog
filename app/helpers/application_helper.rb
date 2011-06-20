module ApplicationHelper
  require 'digest/md5'

  def tag_link_hash
    tags = Tag.all
    hash = Hash.new
    tags.each do |tag|
      hash[tag.tag_name] = "http://"+request.host_with_port+"/blogs?tag="+tag.tag_name 
    end
    return hash 
  end

  def aboutme
    "高升洋，25岁，出生于山东淄博。09年参加工作，作为一名软件工程师，我喜欢我的工作。10年开始学习ruby on rails，很快便喜欢上了他的简练和快捷。现在工作中，主要使用ruby on rails进行开发。开blog希望和大家交流工作和生活中点滴。blog源码可从我的<a href='https://github.com/KimiGao'>github</a>上下载。"
  end

  def gravatar_url_for(email,options = {})
    url_for({:gravatar_id => Digest::MD5.hexdigest(email), :host => 'www.gravatar.com',:protocol => 'http://', :only_path => false, :controller => 'avatar.php'}.merge(options))
  end


  def link_to_website(text,url)
    url = (url.start_with?("http://") ? url : "http://" + url) unless url.to_s == ""
    link_to text,url
  end

  def error_for object
    error_messages = ""
    object.errors.each{|attr,msg| error_messages += "<li>#{msg}</li>"}
    return "<ul>"+ error_messages + "</ul>"
  end

  def show_message messages
    if messages.length > 0
      render(:partial => "home/message",:collection => messages)
    else
      "请留下你的足迹"
    end
  end

  def show_time time
    time.strftime("%Y/%m/%d")
  end

end
