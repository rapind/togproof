require "spec_helper"

describe Admin::PrivateGalleriesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/private_galleries").should route_to("admin/private_galleries#index")
    end

    it "routes to #new" do
      get("/admin/private_galleries/new").should route_to("admin/private_galleries#new")
    end

    it "routes to #show" do
      get("/admin/private_galleries/1").should route_to("admin/private_galleries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/private_galleries/1/edit").should route_to("admin/private_galleries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/private_galleries").should route_to("admin/private_galleries#create")
    end

    it "routes to #update" do
      put("/admin/private_galleries/1").should route_to("admin/private_galleries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/private_galleries/1").should route_to("admin/private_galleries#destroy", :id => "1")
    end

  end
end
