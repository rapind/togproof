class Gallery < ActiveRecord::Base
  acts_as_list

  # Associations
  has_many :photos, :as => :photoable, :dependent => :destroy, :order => :position

  # Cover image attachment
  image_accessor :cover

  # Validations
  validates :meta_title, :length => { :within => 2..128, :allow_blank => true }
  validates :keywords, :length => { :within => 2..255, :allow_blank => true }
  validates :meta_description, :length => { :within => 5..255, :allow_blank => true }
  validates :name, :presence => true, :length => { :within => 2..30 }, :uniqueness => { :case_sensitive => false }
  validates :description, :length => { :minimum => 10, :allow_blank => true }
  validates :body, :length => { :minimum => 10, :allow_blank => true }
  validates :cover, :presence => true

  # Mass-assignment protection
  attr_accessible :name, :meta_title, :keywords, :description, :meta_description, :body, :cover, :photos_attrs

  # Multi-file uploads
  def photos_attrs=(attrs)
    attrs.each { |attr| self.photos.build(:photo => attr) }
  end

  # Slug generation
  def to_param
    "#{id}-#{name}".parameterize
  end

  # Default ordering
  default_scope :order => 'position, id'

  # Callbacks
  after_save :clear_cache
  after_create :log_create_event
  after_update :log_update_event
  after_destroy :clear_cache, :log_destroy_event

  # Caching
  CACHED = 'galleries'

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

  private #----

    # Logging
    def log_create_event
      Event.create(:description => "Created gallery: #{name}")
    end

    def log_update_event
      Event.create(:description => "Changed gallery: #{name}")
    end

    def log_destroy_event
      Event.create(:description => "Deleted gallery: #{name}")
    end

end
