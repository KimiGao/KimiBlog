class AddRnumberToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :r_number, :integer, :default => 0
  end

  def self.down
    remove_column :blogs, :r_number
  end
end
