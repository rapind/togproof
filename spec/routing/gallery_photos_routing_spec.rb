require "spec_helper"

describe Photog::GalleryPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/photog/gallery_photos").should route_to("photog/gallery_photos#index")
    end

    it "routes to #new" do
      get("/photog/gallery_photos/new").should route_to("photog/gallery_photos#new")
    end

    it "routes to #show" do
      get("/photog/gallery_photos/1").should route_to("photog/gallery_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/photog/gallery_photos/1/edit").should route_to("photog/gallery_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/photog/gallery_photos").should route_to("photog/gallery_photos#create")
    end

    it "routes to #update" do
      put("/photog/gallery_photos/1").should route_to("photog/gallery_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/photog/gallery_photos/1").should route_to("photog/gallery_photos#destroy", :id => "1")
    end

  end
end
