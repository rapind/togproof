require "spec_helper"

describe ContactRequestsController do
  describe "routing" do

    it "routes to #new" do
      get("/contact_requests/new").should route_to("contact_requests#new")
    end

    it "routes to #create" do
      post("/contact_requests").should route_to("contact_requests#create")
    end

    it "routes to #thanks" do
      get("/contact_requests/thanks").should route_to("contact_requests#thanks")
    end

  end
end
