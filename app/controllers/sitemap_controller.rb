class SitemapController < ApplicationController

  def index
    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml
    end
  end

end