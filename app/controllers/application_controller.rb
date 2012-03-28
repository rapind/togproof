class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :photographer, :page_links
  before_filter :set_timezone
  
  protected #----

    def photographer
      return @photographer if defined?(@photographer)
      @photographer = Photographer.cached
    end
    
    def page_links
      return @pages if defined?(@pages)
      @pages = Page.cached
    end
    
    def set_timezone
      Time.zone = photographer.time_zone
    end
  
end
