class Post < ActiveRecord::Base

  # Validations
  validates :meta_title, :length => { :within => 2..128, :allow_blank => true }
  validates :keywords, :length => { :within => 2..255, :allow_blank => true }
  validates :meta_description, :length => { :within => 5..255, :allow_blank => true }
  validates :title, :presence => true, :length => { :within => 2..64 }
  validates :body, :presence => true, :length => { :minimum => 10 }

  # Mass-assignment protection
  attr_accessible :title, :meta_title, :keywords, :meta_description, :body, :image, :retained_image

  # Image attachment
  image_accessor :image

  def to_param
    "#{id}-#{title}".parameterize
  end

  # Default ordering
  default_scope :order => 'created_at DESC'

  # Callbacks
  after_save :clear_cache
  after_create :log_create_event
  after_update :log_update_event
  after_destroy :clear_cache, :log_destroy_event

  # Caching
  CACHED = 'posts'
  CACHED_RECENT = 'recent_posts'

  def self.cached
    Rails.cache.fetch(CACHED, :expires_in => 1.day) do
      self.order(:created_at).all
    end
  end

  def self.recent
    Rails.cache.fetch(CACHED_RECENT, :expires_in => 1.day) do
      self.order(:created_at).limit(3).all
    end
  end

  def clear_cache
    Post.clear_cache
  end

  def self.clear_cache
    Rails.cache.delete(CACHED)
    Rails.cache.delete(CACHED_RECENT)
  end

  private #----

    # Logging
    def log_create_event
      Event.create(:description => "Created post: #{title}")
    end

    def log_update_event
      Event.create(:description => "Changed post: #{title}")
    end

    def log_destroy_event
      Event.create(:description => "Deleted post: #{name}")
    end

end