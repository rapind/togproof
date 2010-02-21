class GalleryPhoto < ActiveRecord::Base
  belongs_to :gallery
  acts_as_list :scope => :gallery_id
  
  has_attached_file :image,
                    :styles => { :original => "", :thumb => "" },
                    :path => ":rails_root/public/attachments/galleries/:gallery_id/gallery_photos/:id/:style/:basename.:extension",
                    :url => "/attachments/galleries/:gallery_id/gallery_photos/:id/:style/:basename.:extension",
                    :convert_options => {
                      :original => "-gravity center -thumbnail 660x440^ -extent 660x440",
                      :thumb => "-gravity center -thumbnail 150x100^ -extent 150x100"
                    }
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5000000
  #validates_attachment_content_type :image, :content_type => ['image/jpeg']
  
  after_save :clear_cache
  
  def before_save
    # if no title has been set, use the image's file name but spruce it up a little
    self.title = image_file_name[0, image_file_name.rindex('.')].humanize.titleize if title.blank?
  end
  
  def set_exif_data
    exif = EXIFR::JPEG.new( self.image.path )
    return if exif.nil? or not exif.exif?
    self.width            = exif.width
    self.height           = exif.height
    self.camera_brand     = exif.make
    self.camera_model     = exif.model
    self.exposure_time    = exif.exposure_time.to_s
    self.f_number         = exif.f_number.to_f
    self.iso_speed_rating = exif.iso_speed_ratings
    self.shot_at          = exif.date_time
    self.focal_length     = exif.focal_length.to_f
  rescue
    false
  end
  
  def clear_cache
    # clear the parent gallery show page
    File.delete("#{Rails.root}/public/galleries/#{self.gallery.friendly_id}.html") if File.exists?("#{Rails.root}/public/galleries/#{self.gallery.friendly_id}.html")
  end
  
end
