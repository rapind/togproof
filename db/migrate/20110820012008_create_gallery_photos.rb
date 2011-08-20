class CreateGalleryPhotos < ActiveRecord::Migration
  def change
    create_table :gallery_photos do |t|
      t.references :gallery, :null => false
      t.string :title, :null => false, :limit => 100
      t.string :photo

      t.timestamps
    end
    add_index :gallery_photos, :gallery_id
  end
end
