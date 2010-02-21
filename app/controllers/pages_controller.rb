class PagesController < HomeController
  inherit_resources
  actions :show
  respond_to :html
  
  caches_page :show
  
  def show
    show! do
      @page_title = @page.title
      @page_keywords = @page.keywords.blank? ? "#{@page.title.downcase}, photography, portraits, professional" : @page.keywords
      render :template => '/page'
      return
    end
  end
  
end