class GalleriesController < InheritedResources::Base
  actions :show

  def show
    @gallery = Gallery.find_by_token(params[:id])
    show!
  end

  # def show
  #   @gallery = Gallery.find_by_token(params[:id])
  #
  #   respond_to do |format|
  #     format.html do
  #       template = parse_template('gallery.liquid')
  #       content = template.render('gallery' => @gallery)
  #       render_with_layout(content)
  #     end
  #     format.xml { render :xml => @gallery }
  #     format.json { render :json => @gallery }
  #   end
  # end

end
