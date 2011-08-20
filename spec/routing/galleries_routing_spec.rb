require "spec_helper"

describe Photog::GalleriesController do
  describe "routing" do

    it "routes to #index" do
      get("/photog/galleries").should route_to("photog/galleries#index")
    end

    it "routes to #new" do
      get("/photog/galleries/new").should route_to("photog/galleries#new")
    end

    it "routes to #show" do
      get("/photog/galleries/1").should route_to("photog/galleries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/photog/galleries/1/edit").should route_to("photog/galleries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/photog/galleries").should route_to("photog/galleries#create")
    end

    it "routes to #update" do
      put("/photog/galleries/1").should route_to("photog/galleries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/photog/galleries/1").should route_to("photog/galleries#destroy", :id => "1")
    end

  end
end
