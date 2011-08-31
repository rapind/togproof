class Admin::GalleryPhotosController < Admin::HomeController
  actions :destroy
  respond_to :json
  belongs_to :gallery
end