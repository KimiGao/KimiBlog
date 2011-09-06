class Admin < ActiveRecord::Base
  
  validates :user_name,:uniqueness => {:message => '用户名已存在，请更换'}
  
  def self.validate_user user_name,password
    find :first,:conditions => ["user_name = ? AND password = ?",user_name,password]
  end
end
