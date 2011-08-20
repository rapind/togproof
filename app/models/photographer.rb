class Photographer < ActiveRecord::Base

  # ****
  # Devise modules
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :token_authenticatable

  # ****
  # Validation
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :length => { :within => 5..100 }
  validates :name, :presence => true, :length => { :within => 3..100 }
  validates :theme, :presence => true, :length => { :within => 2..40 }
  validates :phone, :length => { :within => 7..20, :allow_blank => true }
  validates :blog_url, :length => { :within => 10..255, :allow_blank => true }
  validates :facebook_url, :length => { :within => 10..255, :allow_blank => true }
  validates :twitter_url, :length => { :within => 10..255, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :email, :password, :password_confirmation, :name, :phone, :blog_url, :facebook_url, :twitter_url, :theme, :use_watermark, :google_analytics_key, :watermark, :watermark_cache, :remove_watermark, :remember_me

  # ****
  # Attachments
  mount_uploader :logo, LogoUploader
  mount_uploader :watermark, WatermarkUploader

  # We reset the auth token to secure image uploads.
  before_save :reset_authentication_token
end