class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :gallery, :null => false
      t.string :title, :null => false, :limit => 100
      t.string :image

      t.timestamps
    end
    add_index :photos, :gallery_id
  end
end