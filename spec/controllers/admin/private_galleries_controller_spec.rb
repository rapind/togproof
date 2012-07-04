require 'spec_helper'

describe Admin::PrivateGalleriesController do

  before do
    @photographer = FactoryGirl.create(:photographer)
    sign_in @photographer

    @private_gallery = FactoryGirl.create(:private_gallery)
  end

  describe "GET index" do
    it "assigns all private_galleries as @private_galleries" do
      get :index
      assigns(:private_galleries).should include(@private_gallery)
    end
  end

  describe "GET new" do
    it "assigns a new private_gallery as @private_gallery" do
      get :new
      assigns(:private_gallery).should be_a_new(PrivateGallery)
    end
  end

  describe "GET edit" do
    it "assigns the requested private_gallery as @private_gallery" do
      get :edit, :id => @private_gallery.id
      assigns(:private_gallery).should eq(@private_gallery)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Private Gallery" do
        expect {
          post :create, :private_gallery => FactoryGirl.attributes_for(:private_gallery)
        }.to change(PrivateGallery, :count).by(1)
      end

      it "assigns a newly created private_gallery as @private_gallery" do
        post :create, :private_gallery => FactoryGirl.attributes_for(:private_gallery)
        assigns(:private_gallery).should be_a(PrivateGallery)
        assigns(:private_gallery).should be_persisted
      end

      it "redirects to the edit page" do
        post :create, :private_gallery => FactoryGirl.attributes_for(:private_gallery)
        private_gallery = assigns(:private_gallery)
        response.should redirect_to(edit_admin_private_gallery_path(private_gallery))
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested private_gallery" do
        PrivateGallery.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @private_gallery.id, :private_gallery => {'these' => 'params'}
      end

      it "redirects to the edit page" do
        put :update, :id => @private_gallery.id, :private_gallery => { :expires_on => 2.days.from_now }
        response.should redirect_to(edit_admin_private_gallery_path(@private_gallery))
      end
    end

    describe "with invalid params" do
      it "assigns the private_gallery as @private_gallery" do
        # Trigger the behavior that occurs when invalid params are submitted
        PrivateGallery.any_instance.stub(:save).and_return(false)
        put :update, :id => @private_gallery.id, :private_gallery => {}
        assigns(:private_gallery).should eq(@private_gallery)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested private_gallery" do
      expect {
        delete :destroy, :format => :json, :id => @private_gallery.id
      }.to change(PrivateGallery, :count).by(-1)
    end
  end

end
