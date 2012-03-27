class Photo < ActiveRecord::Base

  # ****
  # Associations
  belongs_to :private_gallery, :counter_cache => true
  belongs_to :gallery, :counter_cache => true

  # Photo attachment
  image_accessor :photo
  
  # ****
  # Validations
  validates :name, :presence => true, :length => { :maximum => 100 }
  validates :photo, :presence => true
  
  # ****
  # Mass-assignment protection
  attr_accessible :private_gallery_id, :gallery_id, :name, :photo, :photo_cache

  # ****
  # Callbacks
  before_validation :set_name

  private #----

    # If no name has been set, use the image's file name but spruce it up a little.
    def set_name
      self.name = self.photo.name[0, self.photo.name.rindex('.')].humanize.titleize if self.name.blank? and !self.photo.name.blank?
    end

end
