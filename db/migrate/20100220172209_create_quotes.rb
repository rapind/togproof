class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.references :photographer, :null => false
      t.integer :position, :default => 1
      t.string :author, :null => false, :limit => 80
      t.string :body, :null => false, :limit => 200

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
