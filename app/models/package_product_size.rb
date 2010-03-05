class PackageProductSize < ActiveRecord::Base
  belongs_to :package
  belongs_to :product_size
end
