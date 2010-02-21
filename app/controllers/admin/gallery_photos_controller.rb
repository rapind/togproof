class Admin::GalleryPhotosController < Admin::HomeController
  inherit_resources
  belongs_to :gallery
  actions :all
  respond_to :html
  
  # we need to turn off the admin and auth check for now, because the flash plugin isn't passing this information along,
  #  and because the alternatives are waaaay too complicated right now. TODO - look into this again down the road.
  # see: http://thewebfellas.com/blog/2008/12/22/flash-uploaders-rails-cookie-based-sessions-and-csrf-rack-middleware-to-the-rescue
  skip_before_filter :require_photographer, :verify_authenticity_token, :only => :flash_upload
  # instead we're going to generate our own random token, save it to the parent object, then pass it in the flash uploader's params.
  # Finally we'll verify it before accepting a flash upload
  
  def index
    index! do
      @gallery.uploadify_token = Authlogic::Random.friendly_token
      @gallery.save!
    end
  end
  
  # redirect to collection path on create instead of show
  def create
    create!{ collection_path }
  end
  
  # redirect to collection path on update instead of show
  def update
    update!{ collection_path }
  end
  
  def destroy
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => 'Photo was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the photo. Please try again later.'} }
    end
  end
  
  def flash_upload
    gallery = Gallery.find(params[:gallery_id])
    # validate the uploadify_token param
    unless params[:uploadify_token] and gallery.uploadify_token == params[:uploadify_token]
      logger.error "Invalid uploadify token: #{params[:uploadify_token]}"
      render :json => {:title => 'Error', :message => 'Ran into a problem uploading your photo.'}, :layout => nil
      return # bail
    end
    gallery_photo = gallery.gallery_photos.new(params[:gallery_photo])
    # need to assign the correct content type becuase this is missing from a flash upload
    gallery_photo.image_content_type = MIME::Types.type_for(gallery_photo.image_file_name).to_s
    if gallery_photo.save
      render :json => {:title => 'Success', :message => 'Photo was successfuly created.', :id => gallery_photo.id}
    else
      logger.debug "#{gallery_photo.errors.inspect}"
      render :json => {:title => 'Error', :message => 'Ran into a problem uploading your photo.'}
    end
  end
  
  # update an individual gallery photo's position
  def update_position
    begin
      gallery = Gallery.find(params[:gallery_id]) # grab the parent object
      gallery_photo = gallery.gallery_photos.find(params[:id]) # grab the object
      gallery_photo.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      logger.error $ERROR_INFO.inspect
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
    
end
