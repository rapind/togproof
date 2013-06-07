class GalleriesController < ApplicationController
  respond_to :html

  def show
    @gallery = Gallery.find params[:id]
    @meta_title = @gallery.meta_title || @gallery.name
    @keywords = @gallery.keywords
    @meta_description = @gallery.description
    respond_with @gallery
  end

end
