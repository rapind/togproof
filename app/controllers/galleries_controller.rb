class GalleriesController < HomeController
  inherit_resources
  actions :index, :show
  respond_to :html, :xml
  
  caches_page :index, :show
  
  # set the initial the background image
  def index
    index! do |format|
      format.html do
        redirect_to gallery_path(@galleries.first)
        return
      end
      format.xml { render :template => '/galleries', :layout => false }
    end
  end
  
  def show
    show! do
      @page_title = "#{@gallery.title} Gallery"
      @page_keywords = @gallery.keywords.blank? ? "#{@gallery.title.downcase}, gallery, photography, portraits, professional" : @gallery.keywords
      @page_description = @gallery.description
      @galleries = Gallery.find :all, :order => 'position'
      render :template => '/gallery'
      return
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @galleries ||= end_of_association_chain.find :all, :order => 'position'
    end
  
end
