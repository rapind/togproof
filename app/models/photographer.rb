class Photographer < ActiveRecord::Base

  # ****
  # Devise modules
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :token_authenticatable

  # ****
  # Validation
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :length => { :within => 5..100 }
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
  attr_accessible :email, :password, :password_confirmation, :logo, :name, :description, :phone, :blog_url, :facebook_url, :twitter_url, :google_analytics_key, :disqus_short_name, :conversion_code, :remember_me

  # ****
  # Attachments
  mount_uploader :logo, LogoUploader

  before_save :ensure_authentication_token
end
