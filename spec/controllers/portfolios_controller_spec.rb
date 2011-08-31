require 'spec_helper'

describe PortfoliosController do

  before do
    @portfolio = FactoryGirl.create(:portfolio)
  end

  describe "GET index" do
    it "assigns all portfolios as @portfolios" do
      get :index
      assigns(:portfolios).should include(@portfolio)
    end
  end

  describe "GET show" do
    it "assigns the requested portfolio as @portfolio" do
      get :show, :id => @portfolio.to_param
      assigns(:portfolio).should eq(@portfolio)
    end
  end

end
