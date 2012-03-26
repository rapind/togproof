class Admin::PhotosController < Admin::HomeController
  inherit_resources
  actions :destroy
  respond_to :json
  belongs_to :private_gallery

  def destroy
    destroy! do
      render :json => { :message => 'Success' }
      return
    end
  end
end