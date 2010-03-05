class Package < ActiveRecord::Base
  belongs_to :photographer
  acts_as_list :scope => :photographer_id
  has_many :package_product_sizes, :dependent => :destroy
  has_many :product_sizes, :through => :package_product_sizes, :order => 'product_sizes.position'
  
  validates_presence_of :title, :price
  validates_length_of :title, :within => 3..128
  validates_numericality_of :price
  validates_inclusion_of :price, :in => 0..100000 # sanity check
end
