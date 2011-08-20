class GalleryPhotosController < HomeController

  def show
    gallery = Gallery.find_by_token(params[:gallery_id])
    gallery_photo = gallery.gallery_photos.find(params[:id])

    respond_to do |format|
      format.html do
        template = parse_template('gallery_photo.liquid')
        content = template.render('gallery_photo' => gallery_photo)
        render_with_layout(content)
      end
      format.xml { render :xml => gallery_photo }
      format.json { render :json => gallery_photo }
    end
  end

end
