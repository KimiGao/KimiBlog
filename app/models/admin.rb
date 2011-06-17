class Admin < ActiveRecord::Base
  
  def self.validate_user user_name,password
    find :first,:conditions => ["user_name = ? AND password = ?",user_name,password]
  end
end
