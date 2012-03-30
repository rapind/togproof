class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :position
      t.string :name, :null => false, :limit => 20
      t.string :keywords, :limit => 255
      t.text :description
      t.string :cover_uid
      t.string :cover_name
      
      t.integer :photos_count, :null => false, :default => 0

      t.timestamps
    end
  end
end
