require "spec_helper"

describe Admin::PhotosController do
  describe "routing" do

    before(:each) do
      @gallery_id = FactoryGirl.create(:gallery).id
    end

    it "routes to #destroy" do
      delete("/admin/galleries/#{@gallery_id}/photos/1").should route_to("admin/photos#destroy", :id => "1", :gallery_id => @gallery_id.to_s)
    end

  end
end
