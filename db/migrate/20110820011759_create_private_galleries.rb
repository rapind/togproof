class CreatePrivateGalleries < ActiveRecord::Migration
  def change
    create_table :private_galleries do |t|
      t.string :token, :null => false, :limit => 32
      t.string :name, :null => false, :limit => 100
      t.datetime :expires_on

      t.integer :photos_count, :null => false, :default => 0

      t.timestamps
    end
    add_index :private_galleries, :created_at
    add_index :private_galleries, :token, :unique => true
  end
end