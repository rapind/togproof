require "spec_helper"

describe Photog::PortfolioPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/photog/portfolio_photos").should route_to("photog/portfolio_photos#index")
    end

    it "routes to #new" do
      get("/photog/portfolio_photos/new").should route_to("photog/portfolio_photos#new")
    end

    it "routes to #show" do
      get("/photog/portfolio_photos/1").should route_to("photog/portfolio_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/photog/portfolio_photos/1/edit").should route_to("photog/portfolio_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/photog/portfolio_photos").should route_to("photog/portfolio_photos#create")
    end

    it "routes to #update" do
      put("/photog/portfolio_photos/1").should route_to("photog/portfolio_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/photog/portfolio_photos/1").should route_to("photog/portfolio_photos#destroy", :id => "1")
    end

  end
end
