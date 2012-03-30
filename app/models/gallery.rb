class Gallery < ActiveRecord::Base
  acts_as_list
  
  # ****
  # Associations
  has_many :photos, :dependent => :destroy
  
  # Cover image attachment
  image_accessor :cover
  
  # ****
  # Validations
  validates :name, :presence => true, :length => { :within => 2..100 }, :uniqueness => { :case_sensitive => false }
  validates :keywords, :length => { :within => 2..255, :allow_blank => true }
  validates :description, :length => { :within => 10..8000, :allow_blank => true }
  validates :cover, :presence => true

  # ****
  # Mass-assignment protection
  attr_accessible :name, :keywords, :description, :cover, :photos_attrs
  
  # Multi-file uploads
  def photos_attrs=(attrs)
    attrs.each { |attr| self.photos.build(:photo => attr) }
  end
  
  # ****
  # Default ordering
  default_scope :order => 'position, id'
  
  # Caching
  # -------
  CACHED = 'galleries'
  
  after_save :clear_cache

  def self.cached
    Rails.cache.fetch(CACHED, :expires_in => 1.day) do
      self.order(:position).all
    end
  end

  def clear_cache
    Gallery.clear_cache
  end

  def self.clear_cache
    Rails.cache.delete(CACHED)
  end
  
  # ****
  # Logging
  after_create :log_create_event
  after_update :log_update_event
  
  def to_param
    "#{id}-#{name}".parameterize
  end
  
  private #----
    
    def log_create_event
      Event.create(:description => "Created gallery: #{name}")
    end
    
    def log_update_event
      Event.create(:description => "Changed gallery: #{name}")
    end
    
end
