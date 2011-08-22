class Photog::GalleryPhotosController < Photog::HomeController
  actions :destroy
  respond_to :json
  belongs_to :gallery
end