class Blog < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 5

  has_many :messages

  validates :title,:presence => {:message => "标题不能为空"}
  validates :tag_name,:presence => {:message => "标签不能为空"}
  validates :content,:presence => {:message => "内容不能为空"}
end
