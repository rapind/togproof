class GalleryEvent < ActiveRecord::Base
  
  # ****
  # Associations
  belongs_to :gallery

  # ****
  # Validations
  validates :gallery, :presence => true
  validates :description, :presence => true, :length => { :within => 5..128 }
  
  # ****
  # Mass-assignment protection
  attr_accessible :description
  
end
