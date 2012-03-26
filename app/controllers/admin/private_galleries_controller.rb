class Admin::PrivateGalleriesController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show
  respond_to :html

  def index
    params[:order] = 'name' unless params[:order]
    @private_galleries = PrivateGallery.order(params[:order])

    if defined?(params[:search][:q]) and params[:search][:q]
      term = Regexp.escape(params[:search][:q])
      @private_galleries = @private_galleries.where(["name ~* ?", term])
    end

    respond_to do |format|
      format.html { @private_galleries = @private_galleries.page(params[:page]) } # page html view
      format.json { @private_galleries = @private_galleries.limit(25) } # limit json view
    end
  end
  
  # Set a default expire date
  def new
    new! { @private_gallery.expires_on = 4.weeks.from_now }
  end

  # Redirect to the edit path on create.
  def create
    create!{ collection_path }
  end

  # Redirect to the edit path on update.
  def update
    update!{ collection_path }
  end

  def invite
    @private_gallery = PrivateGallery.find(params[:id])
  end

  def send_invite
    @private_gallery = PrivateGallery.find(params[:id])
    
    # Send the email
    begin
      logger.debug("Send email invitation to: #{params[:email]}")
      PrivateGalleryMailer.invite(photographer.email, params[:email], @private_gallery).deliver
    
      redirect_to collection_path, :notice => 'Private gallery sent.'
    rescue Exception => e
      render :invite, :error => 'The was a problem sending an email to the address you provided.'
    end
  end

end