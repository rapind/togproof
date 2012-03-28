require "spec_helper"

describe Admin::PhotographersController do
  describe "routing" do

    it "routes to #edit" do
      get("/admin/photographer/edit").should route_to("admin/photographers#edit")
    end

    it "routes to #update" do
      put("/admin/photographer").should route_to("admin/photographers#update")
    end

  end
end
