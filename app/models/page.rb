class Page < ActiveRecord::Base

  # Orderable
  acts_as_list

  # ****
  # Validations
  validates :title, :presence => true, :uniqueness => { :case_sensitive => false }, :length => { :within => 2..100 }
  validates :body, :presence => true, :length => { :minimum => 10 }
  validates :keywords, :length => { :within => 3..200, :allow_blank => true }
  validates :summary, :length => { :within => 5..250, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :title, :keywords, :summary, :body, :image, :image_cache, :remove_image

  # Image attachment.
  mount_uploader :image, ImageUploader

  # Slug for SEO.
  def to_param
    "#{id}-#{title.parameterize}"
  end

end
