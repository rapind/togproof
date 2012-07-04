class Admin::PhotosController < Admin::HomeController
  layout false
  respond_to :json
  before_filter :load_resource, :only => [:edit, :update, :destroy]

  def sort
    @photos = []
    if params[:gallery_id]
      @photos = Gallery.find(params[:gallery_id]).photos
    elsif params[:private_gallery_id]
      @photos = PrivateGallery.find(params[:private_gallery_id]).photos
    else
      return
    end

    @photos.each do |photo|
      photo.position = params['photo'].index(photo.id.to_s) + 1
      photo.save
    end

    render :text => 'Success'
    #respond_with :admin, @photos
  end

  def edit
    respond_with :admin, @photo
  end

  def update
    @photo.update_attributes(params[:photo])
    respond_with :admin, @photo
  end

  def destroy
    @photo.destroy
    respond_with :admin, @photo
  end

  private #----

    def load_resource
      @photo = Photo.find params[:id]
    end

end
