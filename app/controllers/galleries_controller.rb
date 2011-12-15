class GalleriesController < ApplicationController
  respond_to :html
  layout 'gallery'

  def show
    @photographer = Photographer.first
    @gallery = Gallery.find_by_token(params[:id])
    if @gallery
      render
    else
      redirect_to(root_path, :alert => "Unable to find that gallery.")
    end
  end

end
