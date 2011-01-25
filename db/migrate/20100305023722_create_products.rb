class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :photographer, :null => false
      t.integer :position, :default => 1
      t.string :title, :null => false, :limit => 128
      t.string :description, :limit => 2000
      t.boolean :active, :null => false, :default => true

      # paperclip attachment fields
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
