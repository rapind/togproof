class Admin::GalleryPhotosController < Admin::HomeController
  inherit_resources
  actions :destroy
  respond_to :json
  belongs_to :gallery
end