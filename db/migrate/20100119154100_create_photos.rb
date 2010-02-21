class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :booking, :null => false
      t.string :title, :null => false, :limit => 128
      
      # paperclip attachment fields
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      
      # exif data fields
      t.integer :width
      t.integer :height
      t.string :camera_brand
      t.string :camera_model
      t.string :exposure_time
      t.float :f_number
      t.integer :iso_speed_rating
      t.float :focal_length
      t.datetime :shot_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
