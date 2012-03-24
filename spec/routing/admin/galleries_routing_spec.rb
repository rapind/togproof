require "spec_helper"

describe Admin::GalleriesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/galleries").should route_to("admin/galleries#index")
    end

    it "routes to #new" do
      get("/admin/galleries/new").should route_to("admin/galleries#new")
    end

    it "routes to #show" do
      get("/admin/galleries/1").should route_to("admin/galleries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/galleries/1/edit").should route_to("admin/galleries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/galleries").should route_to("admin/galleries#create")
    end

    it "routes to #update" do
      put("/admin/galleries/1").should route_to("admin/galleries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/galleries/1").should route_to("admin/galleries#destroy", :id => "1")
    end

  end
end
