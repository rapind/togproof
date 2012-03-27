class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :private_gallery
      t.references :gallery
      t.string :name, :null => false, :limit => 100
      t.string :photo_uid
      t.string :photo_name
      t.integer :view_count, :null => false, :default => 0

      t.timestamps
    end
    add_index :photos, :private_gallery_id
    add_index :photos, [:private_gallery_id, :created_at]
    add_index :photos, :gallery_id
  end
end