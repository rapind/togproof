class Admin::GalleriesController < Admin::HomeController
  respond_to :json, :html
  before_filter :load_resource, :only => [:edit, :update, :destroy]

  def index
    @galleries = Gallery.order(:name)
    respond_with :admin, @galleries
  end

  def new
    respond_with( :admin, @gallery = Gallery.new )
  end

  def create
    @gallery = Gallery.create(params[:gallery])
    if @gallery.valid?
      respond_with(@gallery, :location => edit_admin_gallery_path(@gallery))
    else
      respond_with :admin, @gallery
    end
  end

  def edit
    respond_with :admin, @gallery
  end

  def update
    @gallery.update_attributes params[:gallery]
    if @gallery.valid?
      respond_with(@gallery, :location => edit_admin_gallery_path(@gallery))
    else
      respond_with :admin, @gallery
    end
  end

  def destroy
    @gallery.destroy
    respond_with :admin, @gallery
  end

  private #----

    def load_resource
      @gallery = Gallery.find params[:id]
    end

end