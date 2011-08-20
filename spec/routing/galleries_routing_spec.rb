require "spec_helper"

describe GalleriesController do
  describe "routing" do

    it "routes to #index" do
      get("/galleries").should route_to("galleries#index")
    end

    it "routes to #new" do
      get("/galleries/new").should route_to("galleries#new")
    end

    it "routes to #show" do
      get("/galleries/1").should route_to("galleries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/galleries/1/edit").should route_to("galleries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/galleries").should route_to("galleries#create")
    end

    it "routes to #update" do
      put("/galleries/1").should route_to("galleries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/galleries/1").should route_to("galleries#destroy", :id => "1")
    end

  end
end
