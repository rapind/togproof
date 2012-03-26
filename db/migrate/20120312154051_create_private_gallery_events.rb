class CreatePrivateGalleryEvents < ActiveRecord::Migration
  def change
    create_table :private_gallery_events do |t|
      t.references :private_gallery, :null => false
      t.string :description, :null => false, :limit => 128

      t.timestamp :created_at
    end
    add_index :private_gallery_events, :private_gallery_id
    add_index :private_gallery_events, [:private_gallery_id, :created_at], :name => 'index_private_gallery_events_on_id_and_created_at'
  end
end
