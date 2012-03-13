class Photo < ActiveRecord::Base

  # ****
  # Associations
  belongs_to :gallery, :counter_cache => true

  # ****
  # Validations
  validates :name, :presence => true, :length => { :maximum => 100 }

  # ****
  # Mass-assignment protection
  attr_accessible :gallery_id, :name, :image, :image_cache

  # Photo attachment.
  mount_uploader :image, ImageUploader

  before_validation :set_name

  private #----

    # If no name has been set, use the image's file name but spruce it up a little.
    def set_name
      self.name = self.image.filename[0, self.image.filename.rindex('.')].humanize.titleize if self.name.blank? and !self.image.filename.blank?
    end

end
