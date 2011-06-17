class Blog < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 5

  has_many :messages

  validates_presence_of :title,
    :message => "标题不能为空"
  validates_presence_of :tag_name,
    :message => "标签不能为空"
  validates_presence_of :content,
    :message => "内容不能为空"
end
