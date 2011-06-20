class CreateAboutmes < ActiveRecord::Migration
  def self.up
    create_table :aboutmes do |t|
      t.text    :content
      t.timestamps
    end
  end

  def self.down
    drop_table :aboutmes
  end
end
