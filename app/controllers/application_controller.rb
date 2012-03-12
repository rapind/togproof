class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :photographer
  
  protected #----

    def photographer
      return @photographer if defined?(@photographer)
      @photographer = Photographer.cached
    end  
  
end
