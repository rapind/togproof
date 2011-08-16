class Photographer < ActiveRecord::Base

  # ****
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable, :token_authenticatable

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

  # ****
  # Retrieve the available themes.
  def self.themes
    found_themes = []
    themes_path = File.join(Rails.root, 'themes')

    Dir.glob("#{themes_path}/*").each do |theme_dir|
      if File.directory?(theme_dir)
        found_themes << File.basename(theme_dir)
      end
    end

    found_themes
  end

  # We reset the auth token to secure image uploads.
  before_save :reset_authentication_token

  # ****
  # Expose the following methods to liquid templates.
  # liquid_methods :email, :name, :phone, :blog_url, :facebook_url, :twitter_url, :google_analytics_key, :gallery_photos_count, :portfolio_photos_count

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
