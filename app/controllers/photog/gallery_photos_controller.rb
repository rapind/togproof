class Photog::GalleryPhotosController < Photog::HomeController
  actions :destroy
  respond_to :js
  belongs_to :gallery

  def destroy
    destroy! do |success, failure|
      success.js { render :js => "$('#obj_#{@gallery_photo.to_param}').remove();" }
    end
  end
end