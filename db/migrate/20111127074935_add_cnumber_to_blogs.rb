class AddCnumberToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :c_number, :integer, :default => 0
  end

  def self.down
    remove_column :blogs, :c_number
  end
end
