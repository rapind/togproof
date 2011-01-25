class CreateProductSizes < ActiveRecord::Migration
  def self.up
    create_table :product_sizes do |t|
      t.references :product, :null => false
      t.integer :position, :default => 1
      t.string :title, :null => false, :limit => 128
      t.decimal :price, :precision => 8, :scale => 2, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :product_sizes
  end
end
