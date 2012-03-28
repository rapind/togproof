class Event < ActiveRecord::Base
  
  # ****
  # Validations
  validates :description, :presence => true, :length => { :within => 10..255 }
  
  # ****
  # Mass-assignment protection
  attr_accessible :description
  
  # ****
  # Default ordering
  default_scope :order => 'created_at DESC'
  
  # ****
  # Default page size
  paginates_per 15
  
end