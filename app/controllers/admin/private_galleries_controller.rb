class Admin::PrivateGalleriesController < Admin::HomeController
  respond_to :json, :html
  before_filter :load_resource, :only => [:edit, :update, :destroy, :invite, :send_invite]

  def index
    params[:order] = 'name' unless params[:order]
    @private_galleries = PrivateGallery.order(params[:order])

    if defined?(params[:search][:q]) and params[:search][:q]
      term = Regexp.escape(params[:search][:q])
      @private_galleries = @private_galleries.where(["name ~* ?", term])
    end

    @private_galleries = @private_galleries.page(params[:page])
    respond_with :admin, @private_galleries
  end

  def new
    @private_gallery = PrivateGallery.new
    @private_gallery.expires_on = 4.weeks.from_now
    respond_with :admin, @private_gallery
  end

  def create
    @private_gallery = PrivateGallery.create(params[:private_gallery])
    if @private_gallery.valid?
      respond_with(@private_gallery, :location => edit_admin_private_gallery_path(@private_gallery))
    else
      respond_with :admin, @private_gallery
    end
  end

  def edit
    respond_with :admin, @private_gallery
  end

  def update
    @private_gallery.update_attributes params[:private_gallery]
    if @private_gallery.valid?
      respond_with(@private_gallery, :location => edit_admin_private_gallery_path(@private_gallery))
    else
      respond_with :admin, @private_gallery
    end
  end

  def destroy
    @private_gallery.destroy
    respond_with :admin, @private_gallery
  end

  def invite
  end

  def send_invite
    # Send the email
    begin
      PrivateGalleryMailer.invite(photographer.email, params[:private_gallery][:email], @private_gallery).deliver

      redirect_to admin_private_galleries_path, :notice => 'Private gallery sent.'
    rescue Exception => e
      render :invite, :error => 'The was a problem sending an email to the address you provided.'
    end
  end

  private #----

    def load_resource
      @private_gallery = PrivateGallery.find params[:id]
    end

end
