require "spec_helper"

describe Admin::PortfoliosController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/portfolios").should route_to("admin/portfolios#index")
    end

    it "routes to #new" do
      get("/admin/portfolios/new").should route_to("admin/portfolios#new")
    end

    it "routes to #show" do
      get("/admin/portfolios/1").should route_to("admin/portfolios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/portfolios/1/edit").should route_to("admin/portfolios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/portfolios").should route_to("admin/portfolios#create")
    end

    it "routes to #update" do
      put("/admin/portfolios/1").should route_to("admin/portfolios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/portfolios/1").should route_to("admin/portfolios#destroy", :id => "1")
    end

  end
end
