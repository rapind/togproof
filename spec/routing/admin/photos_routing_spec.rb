require "spec_helper"

describe Admin::PhotosController do
  describe "routing" do

    it "routes to #destroy" do
      delete("/admin/photos/1").should route_to("admin/photos#destroy", :id => "1")
    end

  end
end
