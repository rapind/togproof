class CreateGalleryEvents < ActiveRecord::Migration
  def change
    create_table :gallery_events do |t|
      t.references :gallery, :null => false
      t.string :description, :null => false, :limit => 128

      t.timestamp :created_at
    end
    add_index :gallery_events, :gallery_id
    add_index :gallery_events, [:gallery_id, :created_at]
  end
end
