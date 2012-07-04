require 'spec_helper'

describe Admin::PagesController do
  
  before(:all) do
    @photographer = FactoryGirl.create(:photographer)
  end

  before(:each) do
    sign_in @photographer
    @page = FactoryGirl.create(:page)
  end

  describe "GET index" do
    it "assigns all pages as @pages" do
      get :index
      assigns(:pages).should include(@page)
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
      it "creates a new  Page" do
        expect {
          post :create, :page => FactoryGirl.attributes_for(:page)
        }.to change(Page, :count).by(1)
      end

      it "assigns a newly created page as @page" do
        post :create, :page => FactoryGirl.attributes_for(:page)
        assigns(:page).should be_a(Page)
        assigns(:page).should be_persisted
      end

      it "redirects to the list page" do
        post :create, :page => FactoryGirl.attributes_for(:page)
        response.should redirect_to(admin_pages_path)
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
        put :update, :id => @page.id, :page => FactoryGirl.attributes_for(:page)
        assigns(:page).should eq(@page)
      end

      it "redirects to the list page" do
        put :update, :id => @page.id, :page => FactoryGirl.attributes_for(:page)
        response.should redirect_to(admin_pages_path)
      end
    end

    describe "with invalid params" do
      it "assigns the page as @page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        put :update, :id => @page.id, :page => {}
        assigns(:page).should eq(@page)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested page" do
      expect {
        delete :destroy, :format => :json, :id => @page.id
      }.to change(Page, :count).by(-1)
    end
  end

end
