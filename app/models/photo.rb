class Photo < ActiveRecord::Base
  belongs_to :booking
  has_many :photo_comments, :dependent => :destroy, :order => 'created_at'
  
  # This is a bit complciated, but it saves a lot of the photographer's time to automatically apply a watermark to their originals.
  # I wrote a custom processor for watermarking with ImageMagick which is called after the thumbnail processor.
  # The watermark image itself is uploaded on the settings page, so we need to retrieve it's path and pass it in.
  has_attached_file :image,
                    #:processors => [:thumbnail, :watermark],
                    :styles => { 
                      :large => "640x480>", #{ :geometry => "640x480>", :watermark_path => Proc.new{ self.watermark_path } },
                      :thumb => "" },
                    :default_style => :large,
                    :path => ":rails_root/public/attachments/bookings/:booking_id/photos/:id/:style/:basename.:extension",
                    :url => "/attachments/bookings/:booking_id/photos/:id/:style/:basename.:extension",
                    :convert_options => {
                      :thumb => "-gravity center -thumbnail 150x100^ -extent 150x100"
                    }
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5000000
  #validates_attachment_content_type :image, :content_type => ['image/jpeg']
  
  def before_save
    # if no title has been set, use the image's file name but spruce it up a little
    self.title = image_file_name[0, image_file_name.rindex('.')].humanize.titleize if title.blank? and !image_file_name.blank?
  end
  
  after_save :delete_original
  
  # this determines the path to the photographer's watermark and whether or not they want to use watermarking
  def self.watermark_path
    photographer = Photographer.find :first
    (photographer.use_watermark? and photographer.watermark.file?) ? photographer.watermark.path : ''
  end
  
  # remove the original attachment image if it exists
  def delete_original
    File.delete(image.path(:original)) if File.exists?(image.path(:original))
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
end
