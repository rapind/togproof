class CreatePhotoComments < ActiveRecord::Migration
  def self.up
    create_table :photo_comments do |t|
      t.references :photo, :null => false
      t.references :client
      t.references :photographer
      t.string :body, :null => false, :limit => 2000
      t.timestamp :created_at
    end
  end

  def self.down
    drop_table :photo_comments
  end
end
