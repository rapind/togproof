class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.references :photographer, :null => false
      t.integer :position, :default => 1
      t.string :title, :null => false, :limit => 100
      t.string :keywords, :limit => 200
      t.text :description, :null => false

      # paperclip attachment fields
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
