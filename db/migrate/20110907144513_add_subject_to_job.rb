class AddSubjectToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :subject, :string
  end

  def self.down
    remove_column :jobs, :subject
  end
end
