class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :token, :null => false, :limit => 32
      t.string :title, :null => false, :limit => 100
      t.string :description
      t.datetime :expires_on

      t.integer :gallery_photos_count, :null => false, :default => 0

      t.timestamps
    end
    add_index :galleries, :created_at
    add_index :galleries, :token, :unique => true
  end
end