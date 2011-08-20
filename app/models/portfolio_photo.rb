class PortfolioPhoto < ActiveRecord::Base

  # ****
  # Associations
  belongs_to :portfolio, :counter_cache => true

  # Manual ordering within the portfolio.
  acts_as_list :scope => :portfolio_id

  # Photo attachment.
  mount_uploader :photo, PhotoUploader

  # ****
  # Validations
  validates :title, :presence => true, :length => { :within => 1..100 }

  # ****
  # Mass-assignment protection
  attr_accessible :portfolio_id, :title, :photo, :photo_cache, :remove_photo

  # Build the title from the file name if one wasn't provided.
  before_validation :set_title
  def set_title
    # If no title has been set, use the photo's file name but spruce it up a little.
    self.title = self.photo.filename[0, self.photo.filename.rindex('.')].humanize.titleize if self.title.blank? and !self.photo.filename.blank?
  end

end