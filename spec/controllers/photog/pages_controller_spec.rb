require 'spec_helper'

describe Photog::PagesController do

  before do
    @photographer = FactoryGirl.create(:photographer)
    sign_in @photographer

    @page = FactoryGirl.create(:page)
  end

  describe "GET index" do
    it "assigns all pages as @pages" do
      get :index
      assigns(:pages).should eq([@page])
    end
  end

  describe "GET new" do
    it "assigns a new page as @page" do
      get :new
      assigns(:page).should be_a_new(Page)
    end
  end

  describe "GET edit" do
    it "assigns the requested page as @page" do
      get :edit, :id => @page.id
      assigns(:page).should eq(@page)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Page" do
        expect {
          post :create, :page => FactoryGirl.attributes_for(:page)
        }.to change(Page, :count).by(1)
      end

      it "assigns a newly created page as @page" do
        post :create, :page => FactoryGirl.attributes_for(:page)
        assigns(:page).should be_a(Page)
        assigns(:page).should be_persisted
      end

      it "redirects to the created page" do
        post :create, :page => FactoryGirl.attributes_for(:page)
        response.should redirect_to(photog_pages_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page as @page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        post :create, :page => {}
        assigns(:page).should be_a_new(Page)
      end

      it "re-renders the 'new' template" do
        post :create, :page => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested page" do
        Page.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @page.id, :page => {'these' => 'params'}
      end

      it "assigns the requested page as @page" do
        changed_title = 'Changed Title'
        put :update, :id => @page.id, :page => { :title => changed_title }
        assigns(:page).title.should eq(changed_title)
      end

      it "redirects to the page" do
        put :update, :id => @page.id, :page => { :title => 'Changed Title' }
        response.should redirect_to(photog_pages_url)
      end
    end

    describe "with invalid params" do
      it "assigns the page as @page" do
        put :update, :id => @page.id, :page => { :title => '' }
        assigns(:page).should eq(@page)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => @page.id, :page => { :title => '' }
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested page" do
      expect {
        delete :destroy, :id => @page.id
      }.to change(Page, :count).by(-1)
    end

    it "redirects to the pages list" do
      delete :destroy, :id => @page.id
      response.should redirect_to(photog_pages_url)
    end
  end

end
