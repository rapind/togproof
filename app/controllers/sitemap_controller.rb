class SitemapController < HomeController
  
  caches_page :index
  
  def index
    @pages = Page.find :all, :order => 'position'
    @galleries = Gallery.find :all, :order => 'position'
    render :template => '/sitemap'
  end
  
end