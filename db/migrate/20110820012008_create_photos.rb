class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :gallery, :null => false
      t.string :name, :null => false, :limit => 100
      t.string :image
      t.integer :view_count, :null => false, :default => 0

      t.timestamps
    end
    add_index :photos, :gallery_id
    add_index :photos, [:gallery_id, :created_at]
  end
end