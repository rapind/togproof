require 'spec_helper'
require 'controllers/helper'

describe Photog::PortfoliosController do

  before do
    login_photographer
    @portfolio = FactoryGirl.create(:portfolio)
  end

  describe "GET index" do
    it "assigns all portfolios as @portfolios" do
      get :index
      assigns(:portfolios).should include(@portfolio)
    end
  end

  describe "GET new" do
    it "assigns a new portfolio as @portfolio" do
      get :new
      assigns(:portfolio).should be_a_new(Portfolio)
    end
  end

  describe "GET edit" do
    it "assigns the requested portfolio as @portfolio" do
      get :edit, :id => @portfolio.id
      assigns(:portfolio).should eq(@portfolio)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Portfolio" do
        expect {
          post :create, :portfolio => FactoryGirl.attributes_for(:portfolio)
        }.to change(Portfolio, :count).by(1)
      end

      it "assigns a newly created portfolio as @portfolio" do
        post :create, :portfolio => FactoryGirl.attributes_for(:portfolio)
        assigns(:portfolio).should be_a(Portfolio)
        assigns(:portfolio).should be_persisted
      end

      it "redirects to the portfolio index" do
        post :create, :portfolio => FactoryGirl.attributes_for(:portfolio)
        response.should redirect_to(photog_portfolios_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved portfolio as @portfolio" do
        post :create, :portfolio => { :title => '' }
        assigns(:portfolio).should be_a_new(Portfolio)
      end

      it "re-renders the 'new' template" do
        post :create, :portfolio => { :title => '' }
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested portfolio" do
        changed_keywords = 'Changed Keywords'
        Portfolio.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @portfolio.id, :portfolio => {'these' => 'params'}
      end

      it "assigns the requested portfolio as @portfolio" do
        changed_keywords = 'Changed Keywords'
        put :update, :id => @portfolio.id, :portfolio => { :keywords => changed_keywords }
        assigns(:portfolio).keywords.should eq(changed_keywords)
      end

      it "redirects to the portfolio index" do
        put :update, :id => @portfolio.id, :portfolio => { :keywords => 'Changed Keywords' }
        response.should redirect_to(photog_portfolios_path)
      end
    end

    describe "with invalid params" do
      it "assigns the portfolio as @portfolio" do
        put :update, :id => @portfolio.id, :portfolio => { :title => '' }
        assigns(:portfolio).should eq(@portfolio)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => @portfolio.id, :portfolio => { :title => '' }
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested portfolio" do
      expect {
        delete :destroy, :id => @portfolio.id
      }.to change(Portfolio, :count).by(-1)
    end

    it "redirects to the portfolios list" do
      delete :destroy, :id => @portfolio.id
      response.should redirect_to(photog_portfolios_url)
    end
  end

end
