class PagesController < ApplicationController
  respond_to :html

  def show
    @page = Page.find params[:id]
    @meta_title = @page.meta_title.blank? ? "#{@page.name} | #{photographer.name}" : @page.meta_title
    @keywords = @page.keywords
    @meta_description = @page.meta_description
    respond_with @page
  end

end
