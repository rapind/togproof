class Gallery < ActiveRecord::Base
  
  # ****
  # Associations
  has_many :photos, :dependent => :destroy
  
  # ****
  # Validations
  validates :name, :presence => true, :length => { :within => 2..100 }, :uniqueness => { :case_sensitive => false }
  validates :keywords, :length => { :within => 2..255, :allow_blank => true }
  validates :description, :length => { :within => 10..8000, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :name, :keywords, :description, :cover, :cover_cache
  
  # Cover attachment
  mount_uploader :cover, CoverUploader
  
  # Multi-file uploads
  def photos_attrs=(attrs)
    attrs.each { |attr| self.photos.build(:photo => attr) }
  end
  
end
