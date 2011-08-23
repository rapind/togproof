require "spec_helper"

describe Photog::PhotographersController do
  describe "routing" do

    it "routes to #edit" do
      get("/photog/photographer/edit").should route_to("photog/photographers#edit")
    end

    it "routes to #update" do
      put("/photog/photographer").should route_to("photog/photographers#update")
    end

  end
end
