class Photographer < ActiveRecord::Base

  # ****
  # Devise modules. Others available are: :encryptable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :recoverable, :rememberable, :trackable, :lockable, :validatable
  
  # ****
  # Validation
  validates :name, :presence => true, :length => { :within => 3..100 }
  validates :description, :presence => true, :length => { :within => 10..8000 }
  validates :phone, :length => { :within => 7..20, :allow_blank => true }
  validates :blog_url, :length => { :within => 10..255, :allow_blank => true }
  validates :facebook_url, :length => { :within => 10..255, :allow_blank => true }
  validates :twitter_url, :length => { :within => 10..255, :allow_blank => true }
  validates :disqus_short_name, :length => { :within => 2..64, :allow_blank => true }
  validates :conversion_code, :length => { :within => 10..9000, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :email, :password, :logo, :name, :description, :phone, :blog_url, :facebook_url, :twitter_url, :google_analytics_key, :disqus_short_name, :conversion_code, :remember_me

  # ****
  # Attachments
  mount_uploader :logo, LogoUploader

  # Make sure we always have an auth token assigned.
  before_save :ensure_authentication_token
  
  # Caching
  # -------
  CACHED = 'photographer'
  
  after_save :clear_cache

  def self.cached
    Rails.cache.fetch(CACHED, :expires_in => 1.week) do
      self.first
    end
  end

  def clear_cache
    Photographer.clear_cache
  end

  def self.clear_cache
    Rails.cache.delete(CACHED)
  end
  
end
