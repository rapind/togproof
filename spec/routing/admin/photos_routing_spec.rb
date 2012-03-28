require "spec_helper"

describe Admin::PhotosController do
  describe "routing" do

    before(:each) do
      @private_gallery_id = FactoryGirl.create(:private_gallery).id
    end

    it "routes to #destroy" do
      delete("/admin/private_galleries/#{@private_gallery_id}/photos/1").should route_to("admin/photos#destroy", :id => "1", :private_gallery_id => @private_gallery_id.to_s)
    end

  end
end
