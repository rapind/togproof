class SitemapController < HomeController
  
  caches_page :index
  
  def index
    @pages = @config.pages.find :all
    @galleries = @config.galleries.find :all
    render :template => '/sitemap'
  end
  
end