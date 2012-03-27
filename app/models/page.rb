class Page < ActiveRecord::Base
  
  # ****
  # Validations
  validates :name, :presence => true, :length => { :within => 2..32 }
  validates :body, :presence => true, :length => { :minimum => 10 }

  # ****
  # Mass-assignment protection
  attr_accessible :name, :keywords, :body, :image, :retained_image

  # Image attachment
  image_accessor :image
  
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
      self.order(:name).all
    end
  end

  def clear_cache
    Page.clear_cache
  end

  def self.clear_cache
    Rails.cache.delete(CACHED)
  end
  
  # ****
  # Logging
  after_create :log_create_event
  after_update :log_update_event
  
  private #----
    
    def log_create_event
      Event.create(:description => "Created page: #{name}")
    end
    
    def log_update_event
      Event.create(:description => "Changed page: #{name}")
    end
    
end