class PrivateGalleryEvent < ActiveRecord::Base
  
  # ****
  # Associations
  belongs_to :private_gallery

  # ****
  # Validations
  validates :private_gallery, :presence => true
  validates :description, :presence => true, :length => { :within => 5..128 }
  
  # ****
  # Mass-assignment protection
  attr_accessible :description
  
end
