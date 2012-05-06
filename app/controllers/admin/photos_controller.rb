class Admin::PhotosController < Admin::HomeController
  inherit_resources
  actions :destroy
  respond_to :json
  belongs_to :gallery, :private_gallery, :optional => true

  def destroy
    destroy! do
      render :json => { :message => 'Success' }
      return
    end
  end
  
  def sort
    # We're only ever sorting gallery photos at the moment which simplifies things a bit.
    gallery = Gallery.find(params[:gallery_id])
    gallery.photos.each do |photo|
      photo.position = params['photo'].index(photo.id.to_s) + 1
      photo.save
    end
  end
  
end