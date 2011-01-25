class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :photographer, :null => false
      t.integer :position, :default => 1
      t.string :title, :null => false, :length => 100
      t.string :intro, :length => 100
      t.string :keywords, :limit => 200
      t.text :body, :null => false

      # paperclip attachment fields
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
