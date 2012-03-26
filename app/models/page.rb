class Page < ActiveRecord::Base
  
  # ****
  # Validations
  validates :name, :presence => true, :length => { :within => 2..32 }
  validates :body, :presence => true

  # ****
  # Mass-assignment protection
  attr_accessible :name, :body, :image, :image_cache, :remove_image

  # Image attachment.
  mount_uploader :image, ImageUploader
  
  # ****
  # Pagination
  paginates_per 16
  
  def to_param
    "#{id}-#{name}".parameterize
  end
  
  # Caching
  # -------
  CACHED = 'pages'
  
  after_save :clear_cache

  def self.cached
    Rails.cache.fetch(CACHED, :expires_in => 1.day) do
      Page.order(:name).all
    end
  end

  def clear_cache
    Page.clear_cache
  end

  def self.clear_cache
    Rails.cache.delete(CACHED)
  end
  
end