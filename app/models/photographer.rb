class Photographer < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end
  
  has_many :clients, :dependent => :destroy, :order => 'name'
  has_many :galleries, :dependent => :destroy, :order => 'position'
  has_many :pages, :dependent => :destroy, :order => 'position'
  has_many :quotes, :dependent => :destroy, :order => 'position'
  has_many :packages, :dependent => :destroy, :order => 'position'
  has_many :products, :dependent => :destroy, :order => 'position'
  
  validates_presence_of :email, :company_name, :site_url, :home_page_title
  validates_length_of :site_url, :within => 10..255
  validates_length_of :home_page_title, :within => 5..200
  validates_length_of :company_name, :within => 3..64
  validates_length_of :company_email, :within => 5..100, :allow_blank => true
  validates_length_of :company_phone, :within => 7..20, :allow_blank => true
  validates_length_of :blog_url, :within => 10..255, :allow_blank => true
  validates_length_of :facebook_url, :within => 10..255, :allow_blank => true
  validates_length_of :twitter_url, :within => 10..255, :allow_blank => true
  
  has_many :photo_comments, :dependent => :destroy, :order => 'created_at'
  
  has_attached_file :watermark,
                    :styles => { :original => "640x480>", :thumb => "" },
                    :path => ":rails_root/public/attachments/watermark/:style.:extension",
                    :url => "/attachments/watermark/:style.:extension",
                    :convert_options => {
                      :thumb => "-gravity center -thumbnail 150x100^ -extent 150x100"
                    }
  
  after_save :clear_cache
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_photographer_password_reset_instructions(self)
  end
  
  def deliver_welcome!(unencrypted_password)
    Notifier.deliver_photographer_welcome(self, unencrypted_password)
  end
  
  # returns the path to the theme if one has been set,
  # else returns the default theme path
  def theme_path
    #logger.debug "Previewing theme #{preview}"
    #use_theme = preview.blank? ? theme : preview
    #logger.debug "Using theme: #{use_theme}"
    # set the path to the theme
    path = File.join(Rails.root, 'themes', theme) unless theme.blank?
    # use the default theme if none has been specified, or if the specified theme doesn't exist
    path = File.join(Rails.root, 'themes', 'default') if path.blank? or !File.exists?(path)
    return path
  end
  
  # retrieve the available themes
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
  
  
  def clear_cache
    # clear the home page
    File.delete("#{Rails.root}/public/index.html") if File.exists?("#{Rails.root}/public/index.html")
    # clear the galleries
    system("rm -rf \"#{Rails.root}/public/galleries\"")
    # clear the pages
    system("rm -rf \"#{Rails.root}/public/pages\"")
    # clear the sitemap
    File.delete("#{Rails.root}/public/sitemap.xml") if File.exists?("#{Rails.root}/public/sitemap.xml")
    File.delete("#{Rails.root}/public/sitemap.html") if File.exists?("#{Rails.root}/public/sitemap.html")
  end
  
end
