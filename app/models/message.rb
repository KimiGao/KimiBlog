class Message < ActiveRecord::Base
  belongs_to :blog

  validates_length_of :name,:in => 2..30,
    :message => "昵称长度应在2至30之间"
  validates_format_of :email,:with =>  /^([^@\s]+)@((?:[a-z0-9]+\.)+[a-z]{1,4})/,
    :message => "请输入合法的email地址"
  validates_presence_of :content,
    :message => "请输入留言内容"
  validates_format_of :url,:with => /[a-zA-z]+:\/\/[^\s]*/,
    :message => "请输入正确的网址",:if => :url?

  #get message board information
  scope :board, where('blog_id is null').order('created_at')

end
