require "spec_helper"

describe Photog::PagesController do
  describe "routing" do

    it "routes to #index" do
      get("/photog/pages").should route_to("photog/pages#index")
    end

    it "routes to #new" do
      get("/photog/pages/new").should route_to("photog/pages#new")
    end

    it "routes to #show" do
      get("/photog/pages/1").should route_to("photog/pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/photog/pages/1/edit").should route_to("photog/pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/photog/pages").should route_to("photog/pages#create")
    end

    it "routes to #update" do
      put("/photog/pages/1").should route_to("photog/pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/photog/pages/1").should route_to("photog/pages#destroy", :id => "1")
    end

  end
end
