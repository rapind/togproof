require 'spec_helper'

describe Admin::PhotographersController do

  before(:all) do
    @photographer = FactoryGirl.create(:photographer)
  end
  
  before(:each) do
    sign_in @photographer
  end

  describe "GET edit" do
    it "assigns the requested photographer as @photographer" do
      get :edit
      assigns(:photographer).should eq(@photographer)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested photographer" do
        Photographer.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :photographer => {'these' => 'params'}
      end

      it "assigns the photographer as @photographer" do
        changed_name = 'Changed Name'
        put :update, :photographer => { :name => changed_name }
        assigns(:photographer).should eq(@photographer)
      end

      it "redirects to the photographer" do
        put :update, :photographer => { :name => 'Changed Name' }
        response.should redirect_to(edit_admin_photographer_path)
      end
    end

    describe "with invalid params" do
      it "assigns the photographer as @photographer" do
        put :update, :id => @photographer.id, :photographer => { :name => '' }
        assigns(:photographer).should eq(@photographer)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => @photographer.id, :photographer => { :name => '' }
        response.should render_template("edit")
      end
    end
  end

end
