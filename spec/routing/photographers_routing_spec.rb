require "spec_helper"

describe Photog::PhotographersController do
  describe "routing" do

    it "routes to #show" do
      get("/photog/photographers/1").should route_to("photog/photographers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/photog/photographers/1/edit").should route_to("photog/photographers#edit", :id => "1")
    end

    it "routes to #update" do
      put("/photog/photographers/1").should route_to("photog/photographers#update", :id => "1")
    end

  end
end
