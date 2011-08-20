require "spec_helper"

describe GalleryPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/gallery_photos").should route_to("gallery_photos#index")
    end

    it "routes to #new" do
      get("/gallery_photos/new").should route_to("gallery_photos#new")
    end

    it "routes to #show" do
      get("/gallery_photos/1").should route_to("gallery_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gallery_photos/1/edit").should route_to("gallery_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gallery_photos").should route_to("gallery_photos#create")
    end

    it "routes to #update" do
      put("/gallery_photos/1").should route_to("gallery_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gallery_photos/1").should route_to("gallery_photos#destroy", :id => "1")
    end

  end
end
