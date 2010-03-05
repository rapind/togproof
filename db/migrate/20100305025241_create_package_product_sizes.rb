class CreatePackageProductSizes < ActiveRecord::Migration
  def self.up
    create_table :package_product_sizes do |t|
      t.references :package, :null => false
      t.references :product_size, :null => false
    end
  end

  def self.down
    drop_table :package_product_sizes
  end
end
