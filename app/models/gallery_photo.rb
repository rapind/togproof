class GalleryPhoto < ActiveRecord::Base

  # ****
  # Default ordering
  default_scope order('created_at desc')

  # ****
  # Associations
  belongs_to :gallery, :counter_cache => true

  # ****
  # Validations
  validates :title, :presence => true, :length => { :maximum => 100 }

  # ****
  # Mass-assignment protection
  attr_accessible :gallery_id, :title, :photo, :photo_cache, :remove_photo

  # Photo attachment.
  mount_uploader :photo, PhotoUploader

  # If no title has been set, use the photo's file name but spruce it up a little.
  before_validation :set_title
  def set_title
    self.title = self.photo.filename[0, self.photo.filename.rindex('.')].humanize.titleize if self.title.blank? and !self.photo.filename.blank?
  end

end
