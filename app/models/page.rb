class Page < ActiveRecord::Base
  belongs_to :photographer
  acts_as_list :scope => :photographer_id
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  validates_length_of :title, :within => 2..100
  validates_length_of :body, :minimum => 10
  validates_length_of :keywords, :within => 3..200, :allow_blank => true
  
  has_attached_file :image,
                    :styles => { :thumb => "" },
                    :path => ":rails_root/public/attachments/pages/:id/:style/:basename.:extension",
                    :url => "/attachments/pages/:id/:style/:basename.:extension",
                    :convert_options => {
                      :thumb => "-gravity center -thumbnail 150x100^ -extent 150x100"
                    }
  
  #validates_attachment_content_type :image, :content_type => ['image/jpeg']
  
  has_friendly_id :title, :use_slug => true
  
  after_save :clear_cache
  
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
