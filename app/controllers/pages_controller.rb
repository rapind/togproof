class PagesController < InheritedResources::Base
  actions :show

  # def show
  #   @page = Page.find(params[:id])
  #
  #   respond_to do |format|
  #     format.html do
  #       template = parse_template('page.liquid')
  #       content = template.render('page' => @page)
  #       render_with_layout(content)
  #     end
  #     format.xml { render :xml => @page }
  #     format.json { render :json => @page }
  #   end
  # end

end