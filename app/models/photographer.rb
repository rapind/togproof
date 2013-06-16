class Photographer < ActiveRecord::Base

  # Devise modules. Others available are: :encryptable, :confirmable, :timeoutable and :omniauthable, :trackable
  devise :database_authenticatable, :token_authenticatable, :recoverable, :rememberable, :lockable, :validatable

  # Validations
  validates :meta_title, :length => { :within => 2..128, :allow_blank => true }
  validates :keywords, :length => { :within => 2..255, :allow_blank => true }
  validates :meta_description, :length => { :within => 5..255, :allow_blank => true }
  validates :name, :presence => true, :length => { :within => 3..80 }
  validates :tagline, :presence => true, :length => { :within => 3..128 }
  validates :phone, :length => { :within => 7..20, :allow_blank => true }
  validates :description, :length => { :within => 10..255, :allow_blank => true }
  validates :contact_instructions, :length => { :within => 10..512, :allow_blank => true }
  validates :time_zone, :presence => true, :inclusion => { :in => ActiveSupport::TimeZone.zones_map.keys }
  validates :preferred_domain, :length => { :within => 4..255, :allow_blank => true }
  validates :portfolio_url, :length => { :within => 10..512, :allow_blank => true }
  validates :blog_url, :length => { :within => 10..512, :allow_blank => true }
  validates :facebook_url, :length => { :within => 10..255, :allow_blank => true }
  validates :twitter_url, :length => { :within => 10..255, :allow_blank => true }
  validates :disqus_short_name, :length => { :within => 2..64, :allow_blank => true }
  validates :instagram_id, :length => { :within => 2..128, :allow_blank => true }
  validates :conversion_code, :length => { :within => 10..9000, :allow_blank => true }

  # Mass-assignment protection
  attr_accessible :email, :password, :meta_title, :keywords, :meta_description, :name, :tagline, :time_zone, :description, :contact_instructions, :phone, :preferred_domain, :portfolio_url, :blog_url, :facebook_url, :twitter_url, :disqus_short_name, :instagram_id, :google_analytics_key, :google_verification, :conversion_code, :remember_me

  # Make sure we always have an auth token assigned.
  before_save :ensure_authentication_token

  # Caching
  CACHED = 'photographer'

  after_save :clear_cache

  def self.cached
    #Rails.cache.fetch(CACHED, :expires_in => 1.day) do
      self.first
    #end
  end

  def clear_cache
    #Rails.cache.delete(CACHED)
  end

  def self.clear_cache
    #Rails.cache.delete(CACHED)
  end

  # Logging
  after_update :log_update_event

  private #----

    def log_update_event
      Event.create(:description => "Changed site settings.")
    end

end
