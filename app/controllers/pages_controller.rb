class PagesController < ApplicationController
  respond_to :html

  def show
    @page = Page.find params[:id]
    @meta_title = @page.meta_title || @page.name
    @keywords = @page.keywords
    respond_with @page
  end

end
