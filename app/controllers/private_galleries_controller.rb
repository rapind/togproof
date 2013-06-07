class PrivateGalleriesController < ApplicationController
  respond_to :html

  def show
    @photographer = Photographer.first
    @private_gallery = PrivateGallery.find_by_token(params[:id])
    if @private_gallery
      @meta_title = @private_gallery.name
      render
    else
      redirect_to(root_path, :alert => "Unable to find that private gallery.")
    end
  end

end
