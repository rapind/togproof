class GalleriesController < ApplicationController
  respond_to :html

  def show
    @gallery = Gallery.find params[:id]
    respond_with @gallery
  end

end
