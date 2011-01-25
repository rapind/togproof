class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.references :photographer, :null => false
      t.integer :position, :default => 1
      t.string :title, :null => false, :limit => 128
      t.decimal :price, :precision => 8, :scale => 2, :null => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :packages
  end
end
