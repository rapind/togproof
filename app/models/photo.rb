class Photo < ActiveRecord::Base

  # ****
  # Associations
  belongs_to :gallery, :counter_cache => true

  # ****
  # Validations
  validates :title, :presence => true, :length => { :maximum => 100 }

  # ****
  # Mass-assignment protection
  attr_accessible :gallery_id, :title, :image, :image_cache

  # Photo attachment.
  mount_uploader :image, ImageUploader

  before_validation :set_title

  private #----

    # If no title has been set, use the image's file name but spruce it up a little.
    def set_title
      self.title = self.image.filename[0, self.image.filename.rindex('.')].humanize.titleize if self.title.blank? and !self.image.filename.blank?
    end

end
