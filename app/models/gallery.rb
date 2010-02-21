class Gallery < ActiveRecord::Base
  acts_as_list
  has_many :gallery_photos, :dependent => :destroy, :order => 'position'
  
  validates_presence_of :title, :description
  validates_uniqueness_of :title
  validates_length_of :title, :within => 2..100
  validates_length_of :description, :within => 5..1000
  validates_length_of :keywords, :within => 3..200, :allow_blank => true
  
  has_attached_file :image,
                    :styles => { :original => "", :thumb => "" },
                    :path => ":rails_root/public/attachments/galleries/:id/:style/:basename.:extension",
                    :url => "/attachments/galleries/:id/:style/:basename.:extension",
                    :convert_options => {
                      :original => "-gravity center -thumbnail 960x540^ -extent 960x540",
                      :thumb => "-gravity center -thumbnail 150x100^ -extent 150x100"
                    }
  
  #validates_attachment_content_type :image, :content_type => ['image/jpeg']
  
  has_friendly_id :title, :use_slug => true
  
  after_save :clear_cache
  
  def clear_cache
    # clear the home page
    File.delete("#{Rails.root}/public/index.html") if File.exists?("#{Rails.root}/public/index.html")
    # clear the slides
    File.delete("#{Rails.root}/public/galleries.xml") if File.exists?("#{Rails.root}/public/galleries.xml")
    # clear the galleries
    system("rm -rf \"#{Rails.root}/public/galleries\"")
    # clear the sitemap
    File.delete("#{Rails.root}/public/sitemap.xml") if File.exists?("#{Rails.root}/public/sitemap.xml")
    File.delete("#{Rails.root}/public/sitemap.html") if File.exists?("#{Rails.root}/public/sitemap.html")
  end
  
end
