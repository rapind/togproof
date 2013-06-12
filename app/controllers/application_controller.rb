class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  protect_from_forgery

  helper_method :photographer, :galleries, :pages, :posts, :recent_posts
  before_filter :redirect_to_preferred_domain, :set_timezone

  protected #----

    def redirect_to_preferred_domain
      # redirect the user to your preferred domain.
      unless Rails.env == 'development' or photographer.preferred_domain.blank? or request.host == photographer.preferred_domain
        redirect_to "#{request.protocol}#{photographer.preferred_domain}#{request.fullpath}", :status => 301
      end
    end

    def photographer
      return @photographer if defined?(@photographer)
      @photographer = Photographer.cached
    end

    def galleries
      return @galleries if defined?(@galleries)
      @galleries = Gallery.cached
    end

    def pages
      return @pages if defined?(@pages)
      @pages = Page.cached
    end

    def posts
      return @posts if defined?(@posts)
      @posts = Post.cached
    end

    def recent_posts
      return @recent_posts if defined?(@recent_posts)
      @recent_posts = Post.recent
    end

    def set_timezone
      Time.zone = photographer.time_zone
    end

end
