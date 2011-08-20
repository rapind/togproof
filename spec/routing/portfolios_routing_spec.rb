require "spec_helper"

describe Photog::PortfoliosController do
  describe "routing" do

    it "routes to #index" do
      get("/photog/portfolios").should route_to("photog/portfolios#index")
    end

    it "routes to #new" do
      get("/photog/portfolios/new").should route_to("photog/portfolios#new")
    end

    it "routes to #show" do
      get("/photog/portfolios/1").should route_to("photog/portfolios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/photog/portfolios/1/edit").should route_to("photog/portfolios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/photog/portfolios").should route_to("photog/portfolios#create")
    end

    it "routes to #update" do
      put("/photog/portfolios/1").should route_to("photog/portfolios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/photog/portfolios/1").should route_to("photog/portfolios#destroy", :id => "1")
    end

  end
end
