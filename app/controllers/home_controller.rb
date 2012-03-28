class HomeController < ApplicationController
  layout 'splash'
  
  def timestamp
    render :text => Time.zone.now
  end
  
  def index
    @galleries = Gallery.all
  end

end