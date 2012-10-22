class Photographer < ActiveRecord::Base

  # Devise modules. Others available are: :encryptable, :confirmable, :timeoutable and :omniauthable, :trackable
  devise :database_authenticatable, :token_authenticatable, :recoverable, :rememberable, :lockable, :validatable

  # Validations
  validates :name, :presence => true, :length => { :within => 3..80 }
  validates :tagline, :presence => true, :length => { :within => 3..128 }
  validates :phone, :length => { :within => 7..20, :allow_blank => true }
  validates :description, :length => { :within => 10..255, :allow_blank => true }
  validates :time_zone, :presence => true, :inclusion => { :in => ActiveSupport::TimeZone.zones_map.keys }
  validates :portfolio_url, :length => { :within => 10..512, :allow_blank => true }
  validates :blog_url, :length => { :within => 10..512, :allow_blank => true }
  validates :facebook_url, :length => { :within => 10..255, :allow_blank => true }
  validates :twitter_url, :length => { :within => 10..255, :allow_blank => true }
  validates :disqus_short_name, :length => { :within => 2..64, :allow_blank => true }
  validates :conversion_code, :length => { :within => 10..9000, :allow_blank => true }

  # Mass-assignment protection
  attr_accessible :email, :password, :name, :tagline, :time_zone, :description, :phone, :portfolio_url, :blog_url, :facebook_url, :twitter_url, :google_analytics_key, :conversion_code, :remember_me

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
