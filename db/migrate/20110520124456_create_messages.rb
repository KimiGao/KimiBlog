class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string                    :name
      t.string                    :url
      t.string                    :email
      t.string                    :content
      t.integer                   :blog_id
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
