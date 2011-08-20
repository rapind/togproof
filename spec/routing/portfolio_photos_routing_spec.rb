require "spec_helper"

describe PortfolioPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/portfolio_photos").should route_to("portfolio_photos#index")
    end

    it "routes to #new" do
      get("/portfolio_photos/new").should route_to("portfolio_photos#new")
    end

    it "routes to #show" do
      get("/portfolio_photos/1").should route_to("portfolio_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/portfolio_photos/1/edit").should route_to("portfolio_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/portfolio_photos").should route_to("portfolio_photos#create")
    end

    it "routes to #update" do
      put("/portfolio_photos/1").should route_to("portfolio_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/portfolio_photos/1").should route_to("portfolio_photos#destroy", :id => "1")
    end

  end
end
