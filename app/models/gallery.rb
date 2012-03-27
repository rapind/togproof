class Gallery < ActiveRecord::Base
  acts_as_list
  
  # ****
  # Associations
  has_many :photos, :dependent => :destroy
  
  # Cover image attachment
  image_accessor :cover
  
  # ****
  # Validations
  validates :name, :presence => true, :length => { :within => 2..100 }, :uniqueness => { :case_sensitive => false }
  validates :keywords, :length => { :within => 2..255, :allow_blank => true }
  validates :description, :length => { :within => 10..8000, :allow_blank => true }
  validates :cover, :presence => true

  # ****
  # Mass-assignment protection
  attr_accessible :name, :keywords, :description, :cover
  
  # Multi-file uploads
  def photos_attrs=(attrs)
    attrs.each { |attr| self.photos.build(:photo => attr) }
  end
  
end
