class Admin::PhotosController < Admin::HomeController
  inherit_resources
  belongs_to :booking
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
      @booking.uploadify_token = Authlogic::Random.friendly_token
      @booking.save!
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
    #logger.info request.env.inspect
    booking = Booking.find(params[:booking_id])
    #logger.info "Got booking: #{booking.inspect}"
    # validate the uploadify_token param
    unless params[:uploadify_token] and booking.uploadify_token == params[:uploadify_token]
      logger.error "Invalid uploadify token: #{params[:uploadify_token]}"
      render :json => {:title => 'Error', :message => 'Ran into a problem uploading your photo.'}, :layout => nil
      return # bail
    end
    #logger.info "Has photos: #{booking.photos.inspect}"
    #logger.info "Create a new photo from params:"
    #logger.info params[:photo].inspect
    photo = booking.photos.new(params[:photo])
    #logger.info "Assign a content type"
    # need to assign the correct content type becuase this is missing from a flash upload
    photo.image_content_type = MIME::Types.type_for(photo.image_file_name).to_s
    #logger.info "About to save the photo"
    if photo.save
      #logger.info "*** Photo saved"
      render :json => {:title => 'Success', :message => 'Photo was successfuly created.', :id => photo.id}
    else
      logger.debug "#{photo.errors.inspect}"
      render :json => {:title => 'Error', :message => 'Ran into a problem uploading your photo.'}
    end
  end
  
  def ajax_row
    @booking = Booking.find_by_id(params[:booking_id])
    @photo = @booking.photos.find(params[:id])
    render :layout => nil
  end
    
end
