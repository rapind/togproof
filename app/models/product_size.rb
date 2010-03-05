class ProductSize < ActiveRecord::Base
  belongs_to :product
  has_many :package_product_sizes, :dependent => :destroy
  has_many :packages, :through => :package_product_sizes, :order => 'packages.position'
  acts_as_list :scope => :product_id
  
  validates_presence_of :title, :price
  validates_length_of :title, :within => 3..128
  validates_numericality_of :price
  validates_inclusion_of :price, :in => 0..100000 # sanity check
  
  def composite_title
    "#{self.product.title} - #{self.title}"
  end
end
