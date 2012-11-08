class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  protect_from_forgery

  helper_method :photographer, :galleries, :pages, :posts, :recent_posts
  before_filter :set_timezone

  protected #----

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
