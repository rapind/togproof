require "spec_helper"

describe Admin::PortfolioPhotosController do
  describe "routing" do

    before(:each) do
      @portfolio_id = FactoryGirl.create(:portfolio).id
    end

    it "routes to #destroy" do
      delete("/admin/portfolios/#{@portfolio_id}/portfolio_photos/1").should route_to("admin/portfolio_photos#destroy", :id => "1", :portfolio_id => @portfolio_id.to_s)
    end

  end
end
