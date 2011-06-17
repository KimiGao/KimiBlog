class AddNumberToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :number, :integer, :default => 0
  end

  def self.down
    remove_column :blogs, :number
  end
end
