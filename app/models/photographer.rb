class Photographer < ActiveRecord::Base

  # ****
  # Devise modules. Others available are: :encryptable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :recoverable, :rememberable, :trackable, :lockable, :validatable
  
  # ****
  # Validation
  validates :name, :presence => true, :length => { :within => 3..100 }
  validates :description, :length => { :within => 10..8000, :allow_blank => true }
  validates :phone, :length => { :within => 7..20, :allow_blank => true }
  validates :portfolio_url, :length => { :within => 10..512, :allow_blank => true }
  validates :blog_url, :length => { :within => 10..512, :allow_blank => true }
  validates :facebook_url, :length => { :within => 10..255, :allow_blank => true }
  validates :twitter_url, :length => { :within => 10..255, :allow_blank => true }
  validates :conversion_code, :length => { :within => 10..9000, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :email, :password, :name, :description, :phone, :portfolio_url, :blog_url, :facebook_url, :twitter_url, :google_analytics_key, :conversion_code, :remember_me

  # Make sure we always have an auth token assigned.
  before_save :ensure_authentication_token
  
  # Caching
  # -------
  CACHED = 'photographer'
  
  after_save :clear_cache

  def self.cached
    Rails.cache.fetch(CACHED, :expires_in => 1.day) do
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
