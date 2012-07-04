require 'spec_helper'

describe Admin::GalleriesController do

  before(:all) do
    @photographer = FactoryGirl.create(:photographer)
  end

  before(:each) do
    sign_in @photographer
    @gallery = FactoryGirl.create(:gallery)
  end

  describe "GET index" do
    it "assigns all galleries as @galleries" do
      get :index
      assigns(:galleries).should include(@gallery)
    end
  end

  describe "GET new" do
    it "assigns a new gallery as @gallery" do
      get :new
      assigns(:gallery).should be_a_new(Gallery)
    end
  end

  describe "GET edit" do
    it "assigns the requested gallery as @gallery" do
      get :edit, :id => @gallery.id
      assigns(:gallery).should eq(@gallery)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new  Gallery" do
        expect {
          post :create, :gallery => FactoryGirl.attributes_for(:gallery)
        }.to change(Gallery, :count).by(1)
      end

      it "assigns a newly created gallery as @gallery" do
        post :create, :gallery => FactoryGirl.attributes_for(:gallery)
        assigns(:gallery).should be_a(Gallery)
        assigns(:gallery).should be_persisted
      end

      it "redirects to the edit page" do
        post :create, :gallery => FactoryGirl.attributes_for(:gallery)
        gallery = assigns(:gallery)
        response.should redirect_to(edit_admin_gallery_path(gallery))
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested gallery" do
        Gallery.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @gallery.id, :gallery => {'these' => 'params'}
      end

      it "assigns the requested gallery as @gallery" do
        put :update, :id => @gallery.id
        assigns(:gallery).should eq(@gallery)
      end

      it "redirects to the edit page" do
        put :update, :id => @gallery.id, :gallery => { :description => 'Updated Description Content' }
        response.should redirect_to(edit_admin_gallery_path(@gallery))
      end
    end

    describe "with invalid params" do
      it "assigns the gallery as @gallery" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gallery.any_instance.stub(:save).and_return(false)
        put :update, :id => @gallery.id, :gallery => {}
        assigns(:gallery).should eq(@gallery)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gallery" do
      expect {
        delete :destroy, :format => :json, :id => @gallery.id
      }.to change(Gallery, :count).by(-1)
    end
  end

end
