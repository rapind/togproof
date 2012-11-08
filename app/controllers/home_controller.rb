class HomeController < ApplicationController
  layout 'splash'
  
  def timestamp
    render :text => Time.zone.now
  end
  
  def index
  end

  def sitemap
    render :layout => nil
  end
  
end