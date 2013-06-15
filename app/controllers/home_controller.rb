class HomeController < ApplicationController
  layout 'splash'
  
  def timestamp
    render :text => Time.zone.now
  end
  
  def index
    @meta_title = photographer.meta_title || photographer.name
    @keywords = photographer.keywords
    @meta_description = photographer.description
  end

  def sitemap
    render :layout => nil
  end
  
  def blog
    unless photographer.blog_url.blank?
      redirect_to photographer.blog_url, :status => 301
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
  
end