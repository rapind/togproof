class GalleriesController < ApplicationController
  respond_to :html

  def show
    @gallery = Gallery.find params[:id]
    @meta_title = @gallery.meta_title.blank? ? "#{@gallery.name} | #{photographer.name}" : @gallery.meta_title
    @keywords = @gallery.keywords
    @meta_description = @gallery.meta_description.blank? ? @gallery.description : @gallery.meta_description
    respond_with @gallery
  end

end
