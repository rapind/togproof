require 'spec_helper'

describe PrivateGalleriesController do

  before(:all) do
    FactoryGirl.create(:photographer)
  end

  before(:each) do
    @private_gallery = FactoryGirl.create(:private_gallery)
  end

  describe "GET show" do

    it "assigns the requested private_gallery as @private_gallery when the secret token is used" do
      get :show, :id => @private_gallery.token
      assigns(:private_gallery).should eq(@private_gallery)
    end

    it "should alert the user that the private_gallery couldn't be found when the ID is used instead of a secure token" do
      get :show, :id => @private_gallery.id
      flash[:alert].should eq("Unable to find that private gallery.")
    end

  end

end
